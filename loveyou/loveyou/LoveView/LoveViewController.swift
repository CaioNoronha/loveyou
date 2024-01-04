import UIKit

public final class LoveViewController: UIViewController {

    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    public override func loadView() {
        view = LoveView(viewOwner: self)
        setupNavigation()
    }
    
    private func setupNavigation() {
        title = "Te amo"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension LoveViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}

public typealias CollectionOwner = UICollectionViewDelegate & UICollectionViewDataSource

