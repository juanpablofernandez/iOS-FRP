//: [Previous](@previous)
/*:
 `map`, `filter` and `reduce` are the most important building blocks in functional programming. In essence, all of them are abstractions over common operations on collections (e.g. arrays):
 
 1. `map` will take each element of a collection and _transform_ it to something else
 2. `filter` will _remove_ certain elements from an array that don't adhere to a given condition
 3. `reduce` _combines_ all the elements of an array and outputs a single value
 
 On this playground page, we will implement our own versions of these functions.
 
 ### Challenges
 
 Write the following functions:
 
 1. `func mapIntsToInts(array: [Int], transform: (Int) -> Int) -> [Int]` that applies the `transform` closure on each element in the input `array`
 2. `func mapIntsToStrings(array: [Int], transform: (Int) -> String) -> [String]` that applies the `transform` closure on each element in the input `array`
 3. `func filterInts(array: [Int], isIncluded: (Int) -> Bool) -> [Int]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 4. `func filterStrings(array: [String], isIncluded: (String) -> Bool) -> [String]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 5. `func reduceIntsToInt(array: [Int], initial: Int, combine: (Int, Int) -> Int) -> Int` that reduces all the elements in the input `array` to one single output element of type `Int` by applying the `combine` function to each intermediate result and the current value in the input `array`
 6. `func reduceStringsToString(array: [String], initial: String, combine: (String, String) -> String) -> String` that reduces all the elements in the input `array` to one single output element of type `String` by applying the `combine` function to each intermediate result and the current value in the input `array`
 7. `func reduceIntsToString(array: [Int], initial: String, combine: (String, Int) -> String) -> String` that reduces all the elements in the input `array` to one single output element of type `String` by applying the `combine` function to each intermediate result and the current value in the input `array`

 8. `func map<T, U>(array: [T], transform: (T) -> U) -> [U]` that applies the `transform` closure on each element in the input `array`
 9. `func filter<T>(array: [T], isIncluded: (T) -> Bool) -> [T]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 10. `func reduce<T, U>(array: [T], initial: U, combine: (U, T) -> U) -> U`
 11. recursive versions of `map`, `filter` and `reduce` 😏
 */

let intArray: [Int] = [1,2,3,4,5,6,7]
let stringArray: [String] = ["hello", "world", "this", "is", "jay"]

//Challenge 1:
func mapIntsToInts(array: [Int], transform: (Int) -> Int) -> [Int] {
    var newArray: [Int] = []
    for value in array {
        let test = transform(value)
        newArray.append(test)
    }
    return newArray
}

mapIntsToInts(array: intArray, transform: { value in
    return value + 1
})

//Challenge 2:
func mapIntsToStrings(array: [Int], transform: (Int) -> String) -> [String] {
    var newArray: [String] = []
    for value in array {
        let test = transform(value)
        newArray.append(test)
    }
    return newArray
}

mapIntsToStrings(array: intArray, transform: { value in
    return "\(value)0"
})

//Challenge 3:
func filterInts(array: [Int], isIncluded: (Int) -> Bool) -> [Int] {
    var newArray: [Int] = []
    for value in array {
        if isIncluded(value) {
            newArray.append(value)
        }
    }
    return newArray
}

filterInts(array: intArray, isIncluded: { value in
    let isIncluded: [Int] = [3,5,6]
    return isIncluded.contains(value) ? true : false
})

//Challenge 4:
func filterStrings(array: [String], isIncluded: (String) -> Bool) -> [String] {
    var testArray: [String] = []
    for value in array {
        if isIncluded(value) {
            testArray.append(value)
        }
    }
    return testArray
}

filterStrings(array: stringArray, isIncluded: { value in
    let isIncluded: [String] = ["jay", "world"]
    return isIncluded.contains(value) ? true : false
})

//Challenge 5:
func reduceIntsToInt(array: [Int], initial: Int, combine: (Int, Int) -> Int) -> Int {
    var newInt: Int = initial
    for value in array {
        newInt = combine(newInt, value)
    }
    return newInt
}

reduceIntsToInt(array: intArray, initial: 5, combine: { initial, value in
    return Int("\(initial)\(value)")!
})

//Challenge 6:
func reduceStringsToStrings(array: [String], initial: String, combine: (String, String) -> String) -> String {
    var newString: String = initial
    for value in array {
        newString = combine(newString, value)
    }
    return newString
}

reduceStringsToStrings(array: stringArray, initial: "Result: ", combine: { initial, value in
    return "\(initial)\(value)"
})

//Challenge 7:
func reduceIntsToString(array: [Int], initial: String, combine: (String, Int) -> String) -> String {
    var newString: String = initial
    for value in array {
        newString = combine(newString, value)
    }
    return newString
}

reduceIntsToString(array: intArray, initial: "Result: ", combine: { initial, value in
    return "\(initial)\(value)"
})

//Challenge 8:
func map<T, U>(array: [T], transform: (T) -> U) -> [U] {
    var newArray: [U] = []
    for value in array {
        let test = transform(value)
        newArray.append(test)
    }
    return newArray
}

map(array: intArray, transform: { value in
    return "\(value)0"
})

//Challenge 9:
func filter<T>(array: [T], isIncluded: (T) -> Bool) -> [T] {
    var newArray: [T] = []
    for value in array {
        if isIncluded(value) {
            newArray.append(value)
        }
    }
    return newArray
}

filter(array: stringArray, isIncluded: { value in
    let array = ["jay", "world"]
    return array.contains(value) ? true : false
})

//Challenge 10:
func reduce<T, U>(array: [T], initial: U, combine: (U, T) -> U) -> U {
    var new: U = initial
    for value in array {
        new = combine(new, value)
    }
    return new
}

reduce(array: intArray, initial: "Result: ", combine: { initial, value in
    return "\(initial)\(value)"
})







