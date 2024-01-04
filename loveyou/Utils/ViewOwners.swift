import UIKit

public typealias SearchViewOwner = UISearchBarDelegate
public typealias ResultsViewOwner = TableViewOwner & UIScrollViewDelegate
public typealias HomeViewOwner = TableViewOwner & CollectionOwner
public typealias CollectionOwner = UICollectionViewDelegate & UICollectionViewDataSource
public typealias TableViewOwner = UITableViewDelegate & UITableViewDataSource
