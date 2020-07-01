//: [Insertion Sort](@previous)

/*:
# Selection Sort

## Performance:
## O(n^2)
 
 Selection sort requires as many repetitions as the rest of the presented algorithms. Instead of comparing only our value to change we just simply go through a whole array to look for the smallest number. When the loop reaches an end, it swaps the lowest value with a value that is held by the outer loop, so as the name implies, the lowest available value is "selected" from the unsorted part of the array.
*/

//#-hidden-code
import UIKit
import PlaygroundSupport
let collectionView = CollectionView()
collectionView.setAlgorithm(to: SelectionSort())
PlaygroundPage.current.liveView = collectionView
var numberOfElements: Int
var speed: Double
var sortType: SortType<ColorItem>
//#-end-hidden-code


numberOfElements = /*#-editable-code*/50/*#-end-editable-code*/
speed = /*#-editable-code*/0.1/*#-end-editable-code*/
//#-code-completion(everything, show, .decreasing, .increasing)
sortType = /*#-editable-code*/.increasing/*#-end-editable-code*/


//#-hidden-code
collectionView.setNumberOfItems(to: numberOfElements)
collectionView.setSpeed(to: speed)
collectionView.setSort(to: sortType)
//#-end-hidden-code

//: [End](@next)
