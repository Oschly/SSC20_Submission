import Foundation

public protocol Algorithm {
  func step(comparison: ((ColorItem, ColorItem) -> Bool), updateUI: @escaping (() -> ()))
}
