import UIKit

// Given a number N return the index value of the Fibonacci sequence, where the sequence is:

// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144 ...
// the pattern of the sequence is that each value is the sum of the 2 previous values, that means that for N=5 → 2+3

//For example: fibonacciRecursive(6) should return 8

//O(2^n) very bad
func fibonacciRecursive(index: Int) -> Int {
    
    if index < 2 {
        return index
    }
    
    return fibonacciRecursive(index: (index - 1))  + fibonacciRecursive(index: (index - 2))
}

fibonacciRecursive(index: 5)

//O(n)
func fibonacciIterative(index: Int) -> Int {
    var arr = [0, 1]
    
    for i in 2...index {
        arr.append(arr[i - 1] + arr[i - 2])
    }
    
    return arr[index]
}

print(fibonacciIterative(index: 6))
