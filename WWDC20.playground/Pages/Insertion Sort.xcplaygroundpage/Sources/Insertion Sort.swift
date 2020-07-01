import Foundation

public class InsertionSort: Algorithm {
  private let dataCollection = DataCollection.shared
  
  // If it reaches the count of data, it means that we have went through whole array.
  private var iteration = 0
  
  // Index used for checking two values.
  private var secondIndex = 0
  
  
  public init() {}
  
  public func step(comparison: ((ColorItem, ColorItem) -> Bool), updateUI: @escaping (() -> ())) {
    guard iteration < dataCollection.data.count else {
      // We have sorted whole array, we can stop now.
      NotificationCenter.default.post(name: .init("Stop"), object: nil)
      return
    }
    
    // If given comparison returns true, swap the values
    if secondIndex > 0 && comparison(dataCollection.data[secondIndex], dataCollection.data[secondIndex - 1]) {
      let temp = dataCollection.data[secondIndex]
      dataCollection.data[secondIndex] = dataCollection.data[secondIndex - 1]
      dataCollection.data[secondIndex - 1] = temp
      secondIndex -= 1
      
      updateUI()
    } else {
      // Otherwise it means that our 'inserted' value is now on the place where it should be in sorted array,
      // so we can prepare for the next iteration.
      iteration += 1
      secondIndex = iteration
    }
  }
}
