import UIKit

//O(n logn)
func nonConstructibleChange(coins: [Int]) -> Int {
    
    var currentChangeCreated = 0
    
    for coin in coins.sorted() {
        if coin > currentChangeCreated + 1 {
            return currentChangeCreated + 1
        }
        
        currentChangeCreated += coin
    }
    return currentChangeCreated + 1
}

print(nonConstructibleChange(coins: [1, 2, 9]))
