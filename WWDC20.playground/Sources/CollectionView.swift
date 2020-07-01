import UIKit

public class CollectionView: UIViewController {
  fileprivate var collectionView: UICollectionView! = UICollectionView(frame: .zero,
                                                                       collectionViewLayout: UICollectionViewFlowLayout())
  
  fileprivate var dataSource: UICollectionViewDiffableDataSource<Int, ColorItem>!
  
  fileprivate var sortButton: UIButton!
  
  fileprivate var activityIndicator: UIActivityIndicatorView!
  
  private let data = DataCollection.shared
  
  private var sortSpeed = 1.0
  
  private var timer: Timer?
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    configureDataSource()
    prepareCollectionView()
    configureProgressIndicator()
    configureSortButton()
  }
}

// MARK: - Data Source
public extension CollectionView {
  func applySnapshot() {
    var snapshot = NSDiffableDataSourceSnapshot<Int, ColorItem>()
    snapshot.appendSections([0])
    snapshot.appendItems(data.data)
    
    dataSource.apply(snapshot, animatingDifferences: true)
  }
  
  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Int, ColorItem>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
      guard let cell = collectionView
        .dequeueReusableCell(withReuseIdentifier: "Cell",
                             for: indexPath) as? CustomCell
        else { preconditionFailure() }
      
      cell.backgroundColor = item.color
      
      return cell
    })
  }
  
  func setAlgorithm(to algorithm: Algorithm) {
    data.algorithm = algorithm
  }
  
  func setSpeed(to value: Double) {
    // Mentioned in Welcome page - updating UI in less than 0.1s causes UI bugs.
    guard value >= 0.1 else {
      sortSpeed = 0.1
      return
    }
    
    sortSpeed = value
  }
  
  func setSort(to sortType: SortType<ColorItem>) {
    data.sortBy = sortType
  }
  
  func setNumberOfItems(to value: Int) {
    guard value >= 0 else {
      data.setNumberOfItems(to: 1)
      return
    }
    
    data.setNumberOfItems(to: value)
    applySnapshot()
  }
  
  // Executes one step of algorithm, then updates UI.
  func stepWithUIUpdate() {
    data.step() { [weak self] in
      self?.applySnapshot()
    }
  }
  
  @objc
  func sort() {
    
    // We shouldn't perform expensive operations if there is only one or even zero elements!
    if data.data.count < 2 { return }
    
    NotificationCenter.default.addObserver(forName: .init("Stop"), object: nil, queue: nil) { notification in
      self.timer?.invalidate()
    }
    
    // Behaves like `for in` loop, but it's working greatly with UI.
    timer = Timer.scheduledTimer(withTimeInterval: sortSpeed, repeats: true) { [weak self] timer in
      guard let self = self else { return }
      self.stepWithUIUpdate()
      self.activityIndicator.stopAnimating()
    }
    
    activityIndicator.startAnimating()
    
    sortButton.setTitle("Pause", for: .normal)
    sortButton.removeTarget(self, action: #selector(sort), for: .touchUpInside)
    sortButton.addTarget(self, action: #selector(pauseSorting), for: .touchUpInside)
    
    guard let unwrappedTimer = timer else { return }
    RunLoop.current.add(unwrappedTimer, forMode: .common)
  }
  
  @objc
  func pauseSorting() {
    // Like name of the method says, pause the sorting!
    timer?.invalidate()
    
    // Just double checking if there are any left observers.
    NotificationCenter.default.removeObserver(self)
    
    sortButton.setTitle("Sort", for: .normal)
    sortButton.removeTarget(self, action: #selector(pauseSorting), for: .touchUpInside)
    sortButton.addTarget(self, action: #selector(sort), for: .touchUpInside)
    
    activityIndicator.stopAnimating()
  }
}

// MARK: - UI Configuration
public extension CollectionView {
  func prepareCollectionView() {
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "Cell")
    collectionView.dataSource = dataSource
    view.addSubview(collectionView)
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
  
  func configureSortButton() {
    sortButton = UIButton()
    sortButton.layer.cornerRadius = 8
    sortButton.setTitle("Sort", for: .normal)
    sortButton.backgroundColor = .systemBlue
    sortButton.addTarget(self, action: #selector(sort), for: .touchUpInside)
    sortButton.translatesAutoresizingMaskIntoConstraints = false
    collectionView.addSubview(sortButton)
    
    sortButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    sortButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    sortButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    sortButton.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
  }
  
  func configureProgressIndicator() {
    activityIndicator = UIActivityIndicatorView(style: .medium)
    activityIndicator.hidesWhenStopped = true
    activityIndicator.color = .white
    collectionView.addSubview(activityIndicator)
    
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    activityIndicator.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
    activityIndicator.heightAnchor.constraint(equalToConstant: 10).isActive = true
  }
}


