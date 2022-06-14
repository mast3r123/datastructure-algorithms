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
}

var ll = LinkedList<Int>()
ll.append(value: 9)
ll.append(value: 11)
ll.prepend(value: 5)
//print(ll)
//ll.insert(at: 10, value: 10)
ll.remove(at: 1)
print(ll)
