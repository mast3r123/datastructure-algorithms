import UIKit

func insertionSort(array: inout [Int]) -> [Int] {
    if array.isEmpty { return [] }
    
    for i in 1..<array.count {
        let key = array[i]
        var j = i - 1
        while j >= 0 && array[j] > key {
            array[j + 1] = array[j]
            j = j - 1
        }
        array[j + 1] = key
    }
    
    return array
}

var arr = [99, 34, 23,1, 23, 45, 6,74, 34]
print(insertionSort(array: &arr))
