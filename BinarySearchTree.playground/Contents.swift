import UIKit

class Node<T: Comparable> {
    var element: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(element: T) {
        self.element = element
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(element)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

extension BinaryTree:CustomStringConvertible {
    var description: String {
        guard let root = root else {
            return "Empty Tree"
        }
        return String(describing:root)
    }
    
}

struct BinaryTree<T: Comparable> {
    
    var root: Node<T>?
    
    init() {
        root = nil
    }
    
    mutating func insert(value: T) {
        let newNode = Node(element: value)
        if root == nil {
            root = newNode
        } else {
            var currentNode = root
            while (true) {
                if value < currentNode!.element {
                    
                    if(currentNode?.left == nil) {
                        currentNode?.left = newNode
                        break
                    } else {
                        currentNode = currentNode?.left
                    }
                } else {
                    if(currentNode?.right == nil) {
                        currentNode?.right = newNode
                        break
                    } else {
                        currentNode = currentNode?.right
                    }
                }
            }
        }
    }
    
    mutating func lookup(value: T) -> Node<T>? {
        if(root == nil) {
            return nil
        } else {
            var currentNode = root
            while(currentNode != nil) {
                if value < currentNode!.element {
                    currentNode = currentNode?.left
                } else if(value > currentNode!.element) {
                    currentNode = currentNode?.right
                } else if(value == currentNode?.element) {
                    return currentNode
                }
            }
        }
        return nil
    }
}

var tree = BinaryTree<Int>()

tree.insert(value: 9)
tree.insert(value: 4)
tree.insert(value: 6)
tree.insert(value: 20)
tree.insert(value: 170)
tree.insert(value: 15)
tree.insert(value: 1)

print(tree.lookup(value: 4))
print(tree)
