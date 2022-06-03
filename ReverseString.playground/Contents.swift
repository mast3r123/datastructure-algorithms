import UIKit
import Foundation
//Create a function that reverses a string:
// "Master" should be
// "retsaM"

func reverseString(input: String) -> String {
    var arr: [String] = []
    let input = Array(input)
    
    for i in 0..<input.count {
        let a = (input[input.count - 1 - i])
        arr.append(a.description)
    }
    return arr.joined()
}



//print(reverseString(input: "Master Abhishek"))

//O(n)
func reverseString1(input: String) -> String {
    if (input.isEmpty || input.count < 2) {
        return "Invalid string"
    }
    
    let inputArray = Array(input)
    var backwards = [Character]()
    let totalItems = input.count - 1
    
    for i in stride(from: totalItems, through: 0, by: -1) {
        backwards.append(inputArray[i])
    }
    
    return String(backwards)
}

//print(reverseString1(input: "master"))


//O(1)
func reverseString2(input: String) -> String {
    return String(input.reversed())
}

print(reverseString2(input: "master"))
