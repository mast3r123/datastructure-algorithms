import UIKit

func selectionSort(array: inout [Int]) -> [Int] {
    
    if array.isEmpty { return [] }
    
    for i in 0..<array.count {
        var index = i
        for j in i+1..<array.count {
            if array[j] < array[i] {
                index = j
            }
        }
        array.swapAt(i, index)
    }
    
    return array
}

var input = [5, 4, 3, 2, 1]
print(selectionSort(array: &input))
