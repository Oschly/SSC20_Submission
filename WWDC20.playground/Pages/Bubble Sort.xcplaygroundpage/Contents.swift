//: [Welcome Page](@previous)

/*:
 # Bubble Sort
 
 ## Performance:
 ## O(n^2)
 
 It's one of the simplest algorithms. It starts from the beginning taking the first two values, compares them, and based on the used comparison operator (`less` or `greater` than...) they are swapped or not. In the next iteration, it takes a value from the same index as the first number and the second number is value from the third index. If that second number will be last in the array, in the next iteration the first value becomes value from the next index and the second value is going back from the third index to the last.
 */

//#-hidden-code
import UIKit
import PlaygroundSupport
let collectionView = CollectionView()
collectionView.setAlgorithm(to: BubbleSort())
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


//: [Insertion Sort](@next)
