//
//  HelloWorld.swift
//
//  Created by Tamer Zreg
//  Created on 2024-02-08
//  Version 1.0
//  Copyright (c) Tamer Zreg. All rights reserved.
//
//  This Program is a calculator that includes 6 Different Operations.

// Imports Module
import Foundation

// Print statement asking the user to enter the radius of a sphere
print("Enter a radius of a sphere (unit), (u^1)");

// Do block to handle user input and perform calculations
do {
    // Prompt user for input, and attempt to convert it to a Double
    if let radius = readLine(), let radiusDouble = Double(radius) {
        // Checking if the entered radius is greater than 0
        if radiusDouble > 0 {
            // Assigning the value of the fraction 4/3 to a constant
            let fraction = (4.0 / 3.0);
            // Assigning the value of pi to a constant
            let pi = Double.pi;
            // Calculating the volume of the sphere using the formula (4/3) * pi * radius^3
            let volume = fraction * pi * pow(radiusDouble, 3);
            // Rounding the calculated volume to three decimal places
            let volumeRounded = round(volume * 1000) / 1000;
            // Printing the calculated volume along with appropriate units
            print("Your Volume is \(volumeRounded) (units cubed), (u^3)");
        } else {
            // If the entered radius is not greater than 0, print an error message
            print("Must be a positive number");
        }
    } else {
        // If the input cannot be converted to a Double, print an error message
        print("Invalid input. Please enter a valid number.");
    }
} catch {
    // Catching any other errors that might occur during the execution
    print("An error occurred while processing the input.");
}
