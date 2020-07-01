import Foundation

public class BubbleSort: Algorithm {
  private let dataCollection = DataCollection.shared
  
  // If it reaches the count of data, it means that we have went through whole array. 
  private var iteration = 0
  
  // Index used for checking two values.
  private var index = 1
  
  
  public init() {}
  
  public func step(comparison: ((ColorItem, ColorItem) -> Bool), updateUI: @escaping (() -> ())) {
    
    if index == dataCollection.data.count {
      // Inner loop has reached its end. Prepare for next iteration of outer loop!
      iteration += 1
      index = 1
      return
    }
    
    guard iteration != dataCollection.data.count else {
      // We have sorted whole array, we can stop now.
      NotificationCenter.default.post(name: .init("Stop"), object: nil)
      return
    }
    
    // If given comparison returns true, swap the values.
    if comparison(dataCollection.data[index], dataCollection.data[index - 1]) {
      let tmp = dataCollection.data[index - 1]
      dataCollection.data[index - 1] = dataCollection.data[index]
      dataCollection.data[index] = tmp
      updateUI()
    }
    
    // End single iteration of inner loop, prepare for next iteration.
    index += 1
  }
}
