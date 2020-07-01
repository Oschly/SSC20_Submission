import UIKit

public class CustomCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layer.cornerRadius = 8
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
