//: [Bubble Sort](@previous)

/*:
# Insertion Sort

## Performance:
## O(n^2)

Insertion sort is similar to bubble sort in repetitions count because we are using here nested loops to sort elements in an array, but it works differently. It takes a number, then takes the following number, compares them by a given sort type (again `greater` or `lower` than...) and places in the proper order to make these two sorted. Next it takes the next number in the array and compares it with the last number of our sorted elements, if it matches its sort type it stays in actual position, but if it isn't, these two values are swapped. Then it does the same with the first number and our new second value. These steps are looped to a moment when our algorithm will compare all values within an array in that way.
*/

//#-hidden-code
import UIKit
import PlaygroundSupport
let collectionView = CollectionView()
collectionView.setAlgorithm(to: InsertionSort())
PlaygroundPage.current.liveView = collectionView
var numberOfElements: Int
var speed: Double
var sortType: SortType<ColorItem>
//#-end-hidden-code

numberOfElements = /*#-editable-code*/50/*#-end-editable-code*/
speed = /*#-editable-code*/0.1/*#-end-editable-code*/
sortType = /*#-editable-code*/.increasing/*#-end-editable-code*/

//#-hidden-code
collectionView.setNumberOfItems(to: numberOfElements)
collectionView.setSpeed(to: speed)
collectionView.setSort(to: sortType)
//#-end-hidden-code


//: [Selection Sort](@next)
