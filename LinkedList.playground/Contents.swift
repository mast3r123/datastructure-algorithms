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
    
    //O(1)
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
    
    //O(1)
    mutating func prepend(value: Value) {
        if head == nil {
            head = Node.init(value: value)
            tail = head
        } else {
            head = Node.init(value: value, next: head)
        }
    }
    
    mutating func insert(index: Int, value: Value) {
        if index < 0 {
            print("Invalid index")
        }
        
        if index == 0 {
            prepend(value: value)
            return
        } else {
            let newNode = Node(value: value)
            let leader = traverseToIndex(index: index - 1)
            let holdingPointer = leader?.next
            leader?.next = newNode
            newNode.next = holdingPointer
        }
    }
    
    mutating func traverseToIndex(index: Int) -> Node<Value>? {
        var counter = 0
        var currentNode = head
        
        while(counter != index) {
            currentNode = currentNode?.next
            counter += 1
        }
        
        return currentNode
    }
}

var ll = LinkedList<Int>()
ll.append(value: 9)
ll.append(value: 11)
ll.prepend(value: 5)
print(ll)
ll.insert(index: 1, value: 10)
print(ll)
