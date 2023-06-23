//
//  main.swift
//  test
//
//  Created by Mussa Xamarinov on 15.06.2023.
//


enum InputError : Error{
    case emtyInputValue
    case isNotNumber
    case unKnown
    case divideByZero
}


import Foundation


do{
    print("select math operation: *, +, /, - ")
    let operand : String! = readLine()
    
    try validate(input: operand)
    
    print("enter first value: ")
    let fValue : String! = readLine()
    
    try isNumber(input: fValue)

    print("enter second value: ")

    let sValue : String! = readLine()
    
    try isNumber(input: sValue)
    
    let a = Int(fValue)!;
    let b = Int(sValue)!;
    
    try calc(fValue: a, sValue: b, operand: operand)
    
} catch InputError.emtyInputValue {
    print("enter correct operand!")
} catch InputError.isNotNumber{
    print("enter number!")
} catch InputError.unKnown{
    print("unnkown error!")
} catch {
    print("division by zero :) ")
}


func isNumber(input: String) throws{
    guard Int(input) != nil else{
        throw InputError.isNotNumber
    }
}

func validate(input: String) throws{
    guard !input.isEmpty else {
        throw InputError.emtyInputValue
    }
}

func calc(fValue: Int, sValue: Int, operand: String) throws{
    switch operand {
    case "*": print(fValue * sValue)
    case "/": sValue == 0 ? print("division by zero :) ") : print(fValue / sValue)
    case "-": print(fValue - sValue)
    case "+": print(fValue + sValue)
    default: throw InputError.unKnown
    }
}
