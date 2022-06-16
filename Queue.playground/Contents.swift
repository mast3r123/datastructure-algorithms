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

extension Queue: CustomStringConvertible {
    var description: String {
        if isEmpty() {
            return "Queue is empty"
        } else {
            return "\(String.init(describing: first ?? nil))"
        }
    }
}

struct Queue<Value> {
    var first: Node<Value>?
    var last: Node<Value>?
    var length = 0
    
    init() {}
    
    func isEmpty() -> Bool {
        return first == nil
    }
    
    func peek() -> Node<Value>? {
        return first
    }
    
    mutating func enqueue(value: Value) {
        let newNode = Node(value: value)
        if isEmpty() {
            first = newNode
            last = newNode
        } else {
            last?.next = newNode
            last = newNode
        }
        length += 1
    }
    
    //O(1)
    mutating func dequeue() -> Node<Value>? {
        if isEmpty() {
            return nil
        }
        
        let temp = first
        
        if length == 1 {
            first = nil
            last = nil
            return temp
        }
        
        first = first?.next
        length -= 1
        return temp
    }
}

var queue = Queue<Int>()
queue.enqueue(value: 5)
queue.enqueue(value: 6)
queue.enqueue(value: 7)
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())
print(queue)
