import UIKit

struct MyArray {
    
    var length: Int
    var data: [Int: Any]
    
    init() {
        self.length = 0
        self.data = [:]
    }
    
    //O(1)
    func get(at index: Int) -> Any? {
        return self.data[index]
    }
    
    //O(1)
    mutating func push(item: Any) -> Int {
        self.data[self.length] = item
        self.length += 1
        return self.length
    }
    
    //O(1)
    mutating func pop() -> Any? {
        let lastItem = self.data[self.length - 1]
        self.data[self.length - 1] = nil
        self.length -= 1
        return lastItem
    }
    
    //O(n)
    mutating func delete(at index: Int) -> Any? {
        let item = self.data[index]
        self.shiftItems(index: index)
        return item
    }
    
    mutating func shiftItems(index: Int) {
        for i in index..<self.length - 1 {
            self.data[i] = self.data[i + 1]
        }
        self.pop()
    }
}

var newArr = MyArray()
print(newArr.push(item: "Master"))
print(newArr.push(item: "Abhishek"))
print(newArr.push(item: "Index Two"))
print(newArr.push(item: "Index Three"))
print(newArr.delete(at: 1))
print(newArr)
