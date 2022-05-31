import UIKit

//Given an array and a sum, check wether the array contains a pair of numbers which amount to the sum

//Naive approach
//O(n^2) time complexity as there is a nested loop
func hasPairWithSum(arr: [Int], sum: Int) -> Bool {
    for i in 0..<arr.count {
        for j in i+1..<arr.count {
            if (arr[i] + arr[j] == sum) {
                return true
            }
        }
    }
    return false
}

print(hasPairWithSum(arr: [6, 4, 3, 2, 1, 7, 9], sum: 9))

//Efficient approach
//O(n) as there is a single for loop, space complexity is O(n) as a set is created
func hasPairWithSum1(arr: [Int], sum: Int) -> Bool {
    var set = Set<Int>()
    
    for i in 0..<arr.count {
        if set.contains(arr[i]) {
            return true
        }
        set.insert(sum - arr[i])
    }
    return false
}

print(hasPairWithSum1(arr: [0], sum: 9))
