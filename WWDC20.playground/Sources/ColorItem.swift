import UIKit

public struct ColorItem: Hashable {
  public let id: Int
  public let color: UIColor
  
  public init(id: Int, count: Int) {
    self.id = id
    self.color = UIColor(white: CGFloat(id) / CGFloat(count),
                         alpha: 1)
  }
}

extension ColorItem: Comparable {
  public static func < (lhs: ColorItem, rhs: ColorItem) -> Bool {
    lhs.id < rhs.id
  }
}
