import UIKit

func findFactorialRecursive(number: Int) -> Int {
    
    if number == 0 {
        return 1
    }
    
    return number * findFactorialRecursive(number: number - 1)
}

print(findFactorialRecursive(number: 10))



func findFactorialIterative(number: Int) -> Int {
    var ans = 1
    
    for i in 1...number {
        ans *= (i)
    }
    
    return ans
}

print(findFactorialIterative(number: 2))
