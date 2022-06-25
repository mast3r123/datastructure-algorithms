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
    
    mutating func remove(value: T) {
        if (root == nil) {
            return
        }
        
        var currentNode = root
        var parentNode: Node<T>?
        
        while(currentNode != nil) {
            if (value < currentNode!.element) {
                parentNode = currentNode
                currentNode = currentNode?.left
            } else if (value > currentNode!.element) {
                parentNode = currentNode
                currentNode = currentNode?.right
            } else if (value == currentNode!.element) {
                if currentNode?.right == nil {
                    if parentNode == nil {
                        root = currentNode?.left
                    } else {
                        if currentNode!.element < parentNode!.element {
                            parentNode?.left = currentNode?.left
                        } else if (currentNode!.element > parentNode!.element) {
                            parentNode?.right = currentNode?.left
                        }
                    }
                } else if currentNode?.right?.left == nil {
                    currentNode?.right?.left = currentNode?.left
                    if parentNode == nil {
                        root = currentNode?.right
                    } else {
                        if currentNode!.element < parentNode!.element {
                            parentNode?.left = currentNode?.right
                        } else if (currentNode!.element > parentNode!.element) {
                            parentNode?.right = currentNode?.right
                        }
                    }
                } else {
                    var leftmost = currentNode?.right?.left;
                    var leftmostParent = currentNode?.right;
                    while(leftmost?.left != nil) {
                        leftmostParent = leftmost;
                        leftmost = leftmost?.left;
                    }
                    
                    //Parent's left subtree is now leftmost's right subtree
                    leftmostParent?.left = leftmost?.right;
                    leftmost?.left = currentNode?.left;
                    leftmost?.right = currentNode?.right;
                    
                    if(parentNode == nil) {
                        root = leftmost;
                    } else {
                        if(currentNode!.element < parentNode!.element) {
                            parentNode?.left = leftmost;
                        } else if(currentNode!.element > parentNode!.element) {
                            parentNode?.right = leftmost;
                        }
                    }
                }
            }
        }
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
tree.remove(value: 9)
print(tree)
