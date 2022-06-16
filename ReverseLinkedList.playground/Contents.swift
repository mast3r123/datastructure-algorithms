import UIKit
import Foundation
import Darwin

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
            let newNode = Node.init(value: value)
            tail?.next = newNode
            tail = newNode
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
    
    //O(n)
    mutating func insert(at index: Int, value: Value) {
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
    
    //O(n)
    mutating func remove(at index: Int) {
        if index < 0 {
            print("Invalid Index")
        }
        
        if index == 0 {
            if head?.next == nil {
                head = nil
                tail = nil
            } else {
                head = head?.next
            }
        } else {
            let leader = traverseToIndex(index: index - 1)
            let next = leader?.next
            leader?.next = next?.next
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
    
    mutating func reverse() -> Node<Value>? {
        if head?.next == nil {
            return head
        }
        
        var previous:Node<Value>? = nil
        var currentNode = head
        tail = currentNode
        var next:Node<Value>? = nil
        
        while (currentNode != nil) {
            next = currentNode?.next
            currentNode?.next = previous
            previous = currentNode
            currentNode = next
        }
        head?.next = nil
        head = previous
        return previous
    }
}

var ll = LinkedList<Int>()
ll.append(value: 1)
ll.append(value: 2)
ll.append(value: 3)
//ll.insert(at: 10, value: 10)
let a = ll.reverse()!
print(a)

