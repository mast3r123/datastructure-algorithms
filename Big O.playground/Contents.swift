import UIKit

let nemo = ["nemo"]
let everyone = ["dory", "bruce", "marline", "nemo", "gill", "bloat", "nigel", "squirt", "darla", "hank"]
let arr = [String](repeating: "nemo", count: 100)

func findNemo(array: [String]) {
    for i in 0..<array.count {
        if(array[i] == "nemo") {
            print("Found Nemo")
        }
    }
}

findNemo(array: arr) //O(n) -> Linear time

let boxes = [0, 1, 2, 3, 4, 5]

func logTwoBoxes(array: [Int]) {
    print(array[0]) // O(1)
    print(array[1]) // O(1)
}

logTwoBoxes(array: boxes)
