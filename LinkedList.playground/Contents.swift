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
    var description: String {
        if let next = next {
            return ("\(value) -> next: \(next)")
        } else {
            return ("\(value) -> next: null")
        }
    }
}

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    mutating func append(value: Value) {
        //List is empty
        if head == nil {
            head = Node.init(value: value)
            tail = head
        } else {
            tail?.next = Node.init(value: value)
            tail = Node.init(value: value)
        }
    }
    
    mutating func prepend(value: Value) {
        
        if head == nil {
            head = Node.init(value: value)
            tail = head
        } else {
            head = Node.init(value: value, next: head)
        }
    }
}

var ll = LinkedList<Int>()
ll.append(value: 9)
ll.append(value: 11)
ll.prepend(value: 5)
print(ll)
