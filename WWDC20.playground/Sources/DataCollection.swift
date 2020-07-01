import Foundation

public class DataCollection {
  public static let shared = DataCollection()
  
  // Data that whole playground is depending on.
  public var data = [ColorItem]()
    
  public var algorithm: Algorithm? = nil
  
  public var sortBy: SortType<ColorItem> = .increasing
  
  // Prepare data before sorting it.
  public func setNumberOfItems(to value: Int) {
    var newColorItems = [ColorItem]()
    
    for index in 0..<value {
      let item = ColorItem(id: index, count: value)
      newColorItems.append(item)
    }
    
    data = newColorItems.shuffled()
  }
  
  public func step(completion: @escaping (() -> ())) {
    algorithm?.step(comparison: sortBy.comparison(),
                    updateUI: completion)
  }
}
