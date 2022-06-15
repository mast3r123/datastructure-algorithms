import UIKit
import Foundation

class Node<Value> {
    var value: Value
    var next: Node?
    var prev: Node?
    
    init(value: Value, next: Node? = nil, prev: Node? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
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

struct DoublyLinkedList<Value> {
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
            newNode.prev = tail
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
            let newNode = Node.init(value: value)
            newNode.next = head
            head?.prev = newNode
            head = newNode
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
            let follower = leader?.next
            leader?.next = newNode
            newNode.prev = leader
            newNode.next = follower
            follower?.prev = newNode
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
                let next = head?.next
                next?.prev = nil
                head = next
            }
        } else {
            let leader = traverseToIndex(index: index - 1)
            let next = leader?.next
            let following = next?.next
            leader?.next = following
            following?.prev = leader
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

var ll = DoublyLinkedList<Int>()
ll.append(value: 9)
ll.append(value: 11)
//ll.prepend(value: 5)
//ll.insert(at: 1, value: 10)
ll.remove(at: 1)
print(ll)

