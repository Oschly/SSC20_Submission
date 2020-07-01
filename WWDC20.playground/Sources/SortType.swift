import Foundation

// Helper that makes experience in this Playground even better
public enum SortType<T: Comparable> {
  case increasing
  case decreasing
  
  func comparison() -> (T, T) -> Bool {
    if self == .increasing {
      return (>)
    } else {
      return (<)
    }
  }
}
