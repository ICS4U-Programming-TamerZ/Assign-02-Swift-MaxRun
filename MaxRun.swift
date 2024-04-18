import Foundation

/**
 MaxRun Program
 Author: Tamer Zreg
 Date: April 15, 2024
 Description: This program reads input from a text file, calculates the maximum and minimum runs of consecutive characters for each line individually, and then calculates them for the entire file. It then writes the results to an output file.
 */

func maxRun(_ str: String) -> (maxRun: Int, minRun: Int) {
    // Return (0, 0) if the string is empty
    if str.isEmpty {
        return (0, 0)
    }

    var maxRun = 1 // Initialize the maximum run to 1
    var minRun = Int.max // Initialize the minimum run to the maximum integer value
    var currentRun = 1 // Initialize the current run to 1

    // Loop through the string starting from the second character
    for i in 1..<str.count {
        let currentChar = String(str[str.index(str.startIndex, offsetBy: i)])
        let previousChar = String(str[str.index(str.startIndex, offsetBy: i - 1)])

        // Check if the current character is the same as the previous one (case insensitive)
        if currentChar.lowercased() == previousChar.lowercased() {
            // If they are the same, increment the current run
            currentRun += 1
            // Update the maximum run if the current run is greater
            maxRun = max(maxRun, currentRun)
        } else {
            // If the characters are different, update the minimum run if the current run is less
            minRun = min(minRun, currentRun)
            // Reset the current run to 1
            currentRun = 1
        }
    }

    // Update the minimum run if the last run is less than the current minimum run
    minRun = min(minRun, currentRun)

    // Return the maximum and minimum runs found
    return (maxRun, minRun)
}

// Relative paths for input and output files
let inputFile = "input.txt"
let outputFile = "output.txt"

// Check if the input file exists
let fileManager = FileManager.default
guard fileManager.fileExists(atPath: inputFile) else {
    print("Input file does not exist.")
    exit(0)
}

do {
    // Read input file contents
    let content = try String(contentsOfFile: inputFile)

    // Open output file for writing
    let fileHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: outputFile))

    // Split content into lines
    let lines = content.components(separatedBy: .newlines)

    // Calculate maximum and minimum runs for each line individually
    for line in lines {
        let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
        // Ensure line is not empty
        guard !trimmedLine.isEmpty else {
            continue
        }

        // Calculate maximum and minimum runs for the current line
        let (maxRunLine, minRunLine) = maxRun(trimmedLine.lowercased())

        // Print the result to the console
        print("Max run of '\(trimmedLine)' is: \(maxRunLine)")
        print("Min run of '\(trimmedLine)' is: \(minRunLine)")

        // Write the result to the output file
        let output = "Max run of '\(trimmedLine)' is: \(maxRunLine)\n" +
                     "Min run of '\(trimmedLine)' is: \(minRunLine)\n"
        fileHandle.write(output.data(using: .utf8)!)

    }

    // Calculate maximum and minimum runs for the entire file content
    let (maxRunFile, minRunFile) = maxRun(content.lowercased())

    // Print the result to the console
    print("Max run of the entire file is: \(maxRunFile)")
    print("Min run of the entire file is: \(minRunFile)")

    // Write the result to the output file
    let output = "Max run of the entire file is: \(maxRunFile)\n" +
                 "Min run of the entire file is: \(minRunFile)\n"
    fileHandle.write(output.data(using: .utf8)!)

    // Close the output file
    fileHandle.closeFile()

    // Print a message indicating successful completion
    print("Output has been written to \(outputFile)")

} catch {
    // Print any errors that occur during file handling
    print("Error: \(error)")
}
