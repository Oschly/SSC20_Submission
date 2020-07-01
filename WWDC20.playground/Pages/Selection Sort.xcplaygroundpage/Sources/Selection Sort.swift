import Foundation

public class SelectionSort: Algorithm {
  private let dataCollection = DataCollection.shared
  
  // If it reaches the count of data, it means that we have went through whole array.
  private var iteration = 0
  
  // Used for looking for lowest possible value
  private var index = 1
  
  // Index of the lowest (or highest, depending on the sort type) value found in array.
  private var lowest = 1
  
  
  public init() {}
  
  public func step(comparison: ((ColorItem, ColorItem) -> Bool), updateUI: @escaping (() -> ())) {
    guard iteration < dataCollection.data.count - 1 else {
      // We have sorted whole array, we can stop now.
      NotificationCenter.default.post(name: .init("Stop"), object: nil)
      return
    }
    
    if index < dataCollection.data.count {
      // We can still find some lower value!
      if comparison(dataCollection.data[index], dataCollection.data[lowest]) {
        lowest = index
      }
      
      index += 1
    } else {
      // We have reached end of the inner loop
      if iteration != lowest {
        // Current outer item isn't the lowest value found in array, let's swap them!
        dataCollection.data.swapAt(iteration, lowest)
        updateUI()
      }
      
      // Outer loop finished single iteration, prepare to the next one.
      iteration += 1
      lowest = iteration
      index = iteration + 1
    }
  }
}
