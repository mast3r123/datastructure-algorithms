//Stack implementation usng linkedlist

import UIKit
import Foundation

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String{
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) <- \(next) "
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        if isEmpty() {
            return "Stack is empty"
        } else {
            return "\(String.init(describing: top ?? nil))"
        }
    }
}

struct Stack<Value> {
    var top: Node<Value>?
    var bottom: Node<Value>?
    var length = 0
    
    init() {}
    
    func isEmpty() -> Bool {
        return top == nil
    }
    
    func peek() -> Node<Value>? {
        return top
    }
    
    mutating func pop() -> Node<Value>? {
        if isEmpty() {
            print("Empty stack")
            return nil
        }
        
        if length == 1 {
            let temp = top
            top = nil
            bottom = nil
            length -= 1
            return temp
        } else {
            let temp = top
            top = top?.next
            length -= 1
            return temp
        }
    }
    
    //O(1)
    mutating func push(value: Value) {
        let newNode = Node(value: value)
        
        if isEmpty() {
            top = newNode
            bottom = newNode
        } else {
            let next = top
            top = newNode
            top?.next = next
        }
        
        length += 1
    }
}

var myStack = Stack<Int>()
myStack.push(value: 3)
myStack.push(value: 4)
myStack.push(value: 5)
myStack.pop()
print(myStack.pop())
print(myStack.pop())
