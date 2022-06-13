import UIKit

//Given an array = [2,5,1,2,3,5,1,2,4]:
//It should return 2

//Given an array = [2,1,1,2,3,5,1,2,4]:
//It should return 1

//Given an array = [2,3,4,5]:
//It should return undefined

//O(n^2)
func firstRecurringCharachter(input: [Int]) -> Int {
    for i in 0..<input.count {
        for j in i+1..<input.count {
            if(input[i] == input[j]) {
                return input[i]
            }
        }
    }
    return Int.max
}

print(firstRecurringCharachter(input: [2,3,4,5]))


//O(n)
func firstRecurringCharachter2(input: [Int]) -> Int {
    var dict = [Int: Int]()
    
    for i in 0..<input.count {
        if (dict[input[i]] != nil) {
            return input[i]
        } else {
            dict[input[i]] = i
        }
    }
    return Int.max
}

print(firstRecurringCharachter2(input: [2,3,4,5, 2]))
