//Stack implementation usng array

import UIKit
import Foundation

extension Stack: CustomStringConvertible {
    var description: String {
        let stackElements = arr.map { "\($0)" }.reversed().joined(separator: "\n")
        let topDivider = "----- Top Divider ----- \n"
        let bottomDivider = "\n----- Bottom Divider ------\n"
        return topDivider + stackElements + bottomDivider
    }
}

struct Stack<Value> {
    
    private var arr: [Value] = []
    
    init() {}
    
    func isEmpty() -> Bool {
        return arr.isEmpty
    }
    
    func peek() -> Value? {
        return arr.last
    }
    
    mutating func pop() -> Value? {
        if isEmpty() {
            print("Empty stack")
            return nil
        }
        
        return arr.removeLast()
    }
    
    //O(1)
    mutating func push(value: Value) {
        arr.append(value)
    }
}

var myStack = Stack<Int>()
myStack.push(value: 3)
myStack.push(value: 4)
myStack.push(value: 5)
myStack.pop()
print(myStack)
print(myStack.pop())
print(myStack.pop())

