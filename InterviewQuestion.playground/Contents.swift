import UIKit

// Given 2 arrays, create a function that let's a user know (true/false) whether these two arrays contain any common items
//For Example:
//const array1 = ['a', 'b', 'c', 'x'];//const array2 = ['z', 'y', 'i'];
//should return false.
//-----------
//const array1 = ['a', 'b', 'c', 'x'];//const array2 = ['z', 'y', 'x'];
//should return true.

// 2 parameters - arrays - no size limit
// return true or false


//Brute force approach O(n * m) as there are two arrays which can be of difference sizes
func containsCommonItem(array1: [String], array2: [String]) -> Bool {
    for string1 in array1 {
        for string2 in array2 {
            if string1 == string2 {
                return true
            }
        }
    }
    return false
}

containsCommonItem(array1: ["a", "b", "c", "x"], array2: ["z", "y", "x"])

//More efficient approach O(a + b) time complexity as it loops over two different arrays
func containsCommonItm(array1: [String], array2: [String]) -> Bool {
    
    var map = [String: Bool]()
    //loop through first array and create object where properties === items in the array
    for i in 0..<array1.count {
        if(map[array1[i]] == nil) {
            map[array1[i]] = true
        }
    }
    
    // loop through second array and check if item in second array exists on created object.
    for j in 0..<array2.count {
        if(map[array2[j]] != nil) {
            return true
        }
    }
    
    return false
}

containsCommonItm(array1: ["a", "b", "c", "x"], array2: ["z", "y", "x"])

//Inbuilt array function approach
func containsCommonElements(array1: [String], array2: [String]) -> Bool {
    return array1.contains { elem in
        array2.contains(elem)
    }
}

containsCommonElements(array1: ["a", "b", "c", "r"], array2: ["z", "y", "x"])
