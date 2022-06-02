import UIKit
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

print(reverseString(input: "Master Abhishek"))
