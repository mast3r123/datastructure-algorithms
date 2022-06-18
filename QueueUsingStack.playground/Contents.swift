import UIKit
import Foundation

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

struct Queue<Value> {
    var inbox = Stack<Value>()
    var outbox = Stack<Value>()
    
    init() {
        
    }
    
    mutating func enqueue(value: Value) {
        inbox.push(value: value)
    }
    
    mutating func dequeue() -> Value? {
        if outbox.isEmpty() {
            while (!inbox.isEmpty()) {
                outbox.push(value: inbox.pop()!)
            }
        }
        return outbox.pop()
    }
    
    mutating func peek() -> Value? {
        if outbox.isEmpty() {
            while !inbox.isEmpty() {
                outbox.push(value: inbox.pop()!)
            }
        }
        return outbox.pop()
    }
}

var queue = Queue<Int>()
queue.enqueue(value: 1)
queue.enqueue(value: 2)
queue.enqueue(value: 3)
queue.enqueue(value: 4)
queue.dequeue()
print(queue.peek())
