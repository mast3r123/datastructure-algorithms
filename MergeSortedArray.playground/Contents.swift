import UIKit

//Merge sorted arrays ([0, 3, 4, 31], [4, 6, 30]) to [0, 3, 4, 4, 6, 30, 31]

func mergeSortedArrays(array1: [Int], array2: [Int]) -> [Int] {
    var mergedArray = [Int]()
    
    var array1Item: Int? = array1[0]
    var array2Item: Int? = array2[0]
    
    var i = 1
    var j = 1
    
    if (array1.isEmpty) {
        return array2
    }
    
    if(array2.isEmpty) {
        return array1
    }
    
    while(array1Item != nil || array2Item != nil) {
        
        if array1Item == nil {
            mergedArray.append(array2Item!)
            
            if j < array2.count {
                array2Item = array2[j]
                j += 1
            } else {
                array2Item = nil
            }
            continue
        }
        
        if array2Item == nil {
            mergedArray.append(array1Item!)
            
            if i < array1.count {
                array1Item = array1[i]
                i += 1
            } else {
                array1Item = nil
            }
            continue
        }
        
        if (array1Item! < array2Item!) {
            mergedArray.append(array1Item!)
            
            if i < array1.count {
                array1Item = array1[i]
                i += 1
            } else {
                array1Item = nil
            }
        } else {
            mergedArray.append(array2Item!)
            
            if j < array2.count {
                array2Item = array2[j]
                j += 1
            } else {
                array2Item = nil
            }
        }
    }
    
    return mergedArray
}


print(mergeSortedArrays(array1: [0, 3, 4, 31], array2: [4, 6, 30]))
