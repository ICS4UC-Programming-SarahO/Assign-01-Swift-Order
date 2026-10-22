import Foundation

// Constants and stuff
let hst: Double = 0.13
let vegPlate: Double = 10.00
let meatPlate: Double = 12.99
let vegWrap: Double = 7.99
let meatWrap: Double = 9.99
let drinkPrice: Double = 1.99
let burgerPrice: Double = 8.99
let largeBurgerAdd: Double = 2.00
let comboAdd: Double = 3.00

// variables WOAH!
var continueOrdering = true
var runningSubtotal = 0.0 // Accumulates total across alllll items ordered

print("Welcome to Sarah's Shawarma & Burger Joint!")

// Main ordering loop
repeat {
    var mainChoice = 0
    var validMainInput = false
    
    // Input validation loop for main menu
    while !validMainInput {
        print("\nSelect Main Menu Option:\n1 - Shawarma Menu\n2 - Burger Menu\nChoice (1-2): ", terminator: "")
        if let inputString = readLine(), let inputNum = Int(inputString) {
            if inputNum >= 1 && inputNum <= 2 {
                mainChoice = inputNum
                validMainInput = true // Exit loop if valid input yayaya
            } else {
                print("Out of range error! Enter a number between 1 and 2.")
            }
        } else {
            print("Invalid input type! Please enter an integer number.")
        }
    }
    
    var currentItemPrice = 0.0 // Price of the current item being ordered, will be added to runningSubtotal later
    
    if mainChoice == 1 {
        print("\n--- Shawarma Menu ---")
        
        // Get type choice (Plate vs Wrap)
        // 1 = Plate, 2 = Wrap
        var typeChoice = 0 
        var validTypeInput = false
        while !validTypeInput { // loop until valid input is received
            print("1 - Plate\n2 - Wrap\nSelect option (1-2): ", terminator: "")
            if let inputString = readLine(), let inputNum = Int(inputString) {
                // if inputString can be converted to Int, check if it's in range
                if inputNum >= 1 && inputNum <= 2 {
                    typeChoice = inputNum
                    validTypeInput = true
                } else {
                    print("Out of range error! Enter a number between 1 and 2.")
                }
            } else {
                print("Invalid input type! Please enter an integer number.")
            }
        }
        
        // Get filling choice (Meat vs Veg)
        var fillingChoice = 0
        var validFillingInput = false
        while !validFillingInput {
            print("1 - Meat\n2 - Vegetarian\nSelect filling (1-2): ", terminator: "")
            if let inputString = readLine(), let inputNum = Int(inputString) {
                if inputNum >= 1 && inputNum <= 2 {
                    fillingChoice = inputNum
                    validFillingInput = true
                } else {
                    print("Out of range error! Enter a number between 1 and 2.")
                }
            } else {
                print("Invalid input type! Please enter an integer number.")
            }
        }
        
        // Calculate base price
        // source
        // https://www.hackingwithswift.com/sixty/3/7/the-ternary-operator 
        if typeChoice == 1 {
            currentItemPrice = (fillingChoice == 1) ? meatPlate : vegPlate
        } else {
            currentItemPrice = (fillingChoice == 1) ? meatWrap : vegWrap
        }
        print("Base price: $\(currentItemPrice)")
        
        // Drink option
        var drinkChoice = 0
        var validDrinkInput = false
        while !validDrinkInput {
            print("Add a drink for $1.99? (1 = Yes, 2 = No): ", terminator: "") 
            // Terminator is used to avoid newline after print
            if let inputString = readLine(), let inputNum = Int(inputString) {
                if inputNum >= 1 && inputNum <= 2 {
                    drinkChoice = inputNum
                    validDrinkInput = true
                } else {
                    print("Out of range error! Enter a number between 1 and 2.")
                }
            } else {
                print("Invalid input type! Please enter an integer number.")
            }
        }
        
        if drinkChoice == 1 {
            currentItemPrice += drinkPrice
        }
        
    } else if mainChoice == 2 {
        print("\n--- Burger Menu ---")
        
        // Get size choice
        var sizeChoice = 0
        var validSizeInput = false
        while !validSizeInput {
            print("1 - Large ($10.99)\n2 - Regular ($8.99)\nSelect size (1-2): ", terminator: "")
            if let inputString = readLine(), let inputNum = Int(inputString) {
                if inputNum >= 1 && inputNum <= 2 {
                    sizeChoice = inputNum
                    validSizeInput = true
                } else {
                    print("Out of range error! Enter a number between 1 and 2.")
                }
            } else {
                print("Invalid input type! Please enter an integer number.")
            }
        }
        
        currentItemPrice = burgerPrice + ((sizeChoice == 1) ? largeBurgerAdd : 0.0)
        
        // Get combo choice
        var comboChoice = 0
        var validComboInput = false
        while !validComboInput {
            print("Make it a combo (Fries & Drink) for $3.00 extra? (1 = Yes, 2 = No): ", terminator: "")
            if let inputString = readLine(), let inputNum = Int(inputString) {
                if inputNum >= 1 && inputNum <= 2 { 
                    comboChoice = inputNum
                    validComboInput = true
                } else {
                    print("Out of range error! Enter a number between 1 and 2.")
                }
            } else {
                print("Invalid input type! Please enter an integer number.")
            }
        }
        
        if comboChoice == 1 {
            currentItemPrice += comboAdd
        }
    }
    
    // Add the current item's cost to the total running subtotal
    runningSubtotal += currentItemPrice
    
    // Ask if user wants to place another order
    var againChoice = 0
    var validAgainInput = false
    while !validAgainInput {
        print("\nWould you like to place another order? (1 = Yes, 2 = No): ", terminator: "")
        if let inputString = readLine(), let inputNum = Int(inputString) {
            if inputNum >= 1 && inputNum <= 2 {
                againChoice = inputNum
                validAgainInput = true
            } else {
                print("Out of range error! Enter a number between 1 and 2.")
            }
        } else {
            print("Invalid input type! Please enter an integer number.")
        }
    }
    
    if againChoice == 2 {
        continueOrdering = false
    }

} while continueOrdering

// Calculate final grand total for ALL orders combined
let tax = runningSubtotal * hst
let grandTotal = runningSubtotal + tax

// Print Final Receipt
// Source : 
// https://stackoverflow.com/questions/52332747/what-are-the-supported-swift-string-format-specifiers 
print("\n--- Final Order Receipt ---")
print(String(format: "Subtotal:  $%6.2f", runningSubtotal))
print(String(format: "HST (13%%): $%6.2f", tax))
print(String(format: "Total:     $%6.2f", grandTotal))
print("Please pull up to the window to pay and collect your order!")
print("\nThank you for visiting! Have a wonderful day.")
print("⸜(｡˃ ᵕ ˂ )⸝♡") ; 