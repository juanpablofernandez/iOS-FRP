//: [Next](@next)
/*:
 
 ### Challenges
 
 Write the following functions: 
 
 1. `makeAllUppercase` that takes an array of `String`s and returns an array of `String`s; all the strings in the returned array should only contain uppercase characters
 2. `convertAllToString` that takes an array of `Int`s and returns an array of `String`s where every `Int` was transformed to a `String`
 3. `keepOnlyOdds` that takes an array of `Int`s and returns an array of `Int`s that only has odd numbers
 4. `startingWithA` that takes an array of `String`s and returns an array of `String`s that only contains `String`s that start with the (uppercase) letter `A`
 5. `computeProduct` that takes an array of `Int`s and returns a single `Int` that is the product of all the elements in the array
 6. `concatenateAll` that takes an array of `String`s and returns a `String` that is concatenates all the elements in the array
 
 */


let stringArray: [String] = ["hello", "world", "this", "is", "jay", "Apple"]
let intArray: [Int] = [1, 2, 3, 3, 4, 5]

func makeAllUperCase(array: [String]) -> [String] {
    var newArray: [String] = []
    for i in array {
        newArray.append(i.uppercased())
    }
    return newArray
}
makeAllUperCase(array: stringArray)

func convertAllToString(array: [Int]) -> [String] {
    var newArray: [String] = []
    for i in array {
        newArray.append(String(i))
    }
    return newArray
}
convertAllToString(array: intArray)

func keepOnlyOdds(array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for i in array {
        if i % 2 != 0 {
            newArray.append(i)
        }
    }
    return newArray
}
keepOnlyOdds(array: intArray)

func startingWithA(array: [String]) -> [String] {
    var newArray: [String] = []
    for i in array {
        if i[i.startIndex] == "A" {
            newArray.append(i)
        }
    }
    return newArray
}
startingWithA(array: stringArray)

func computeProduct(array: [Int]) -> Int {
    var newProduct: Int = 1
    for number in array {
        newProduct = newProduct * number
    }
    return newProduct
}
computeProduct(array: intArray)

func concatenateAll(array: [String]) -> String {
    var newString: String = ""
    for i in array {
        newString += i
    }
    return newString
}
concatenateAll(array: stringArray)










