import UIKit

func bubbleSort(input: [Int]) {
    
    var arr = input
    
    if arr.isEmpty { return }
    
    for _ in 0..<arr.count {
        for j in 0..<arr.count - 1 {
            if (arr[j] > arr[j + 1]) {
                let temp = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
            }
        }
    }
    
    print(arr)
}

print(bubbleSort(input: [5, 4, 3, 2, 1]))

