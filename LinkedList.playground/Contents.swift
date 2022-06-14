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
            return ("\(value) -> \(next)")
        } else {
            return ("\(value)")
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
}

var ll = LinkedList<Int>()
ll.append(value: 9)
print(ll)
