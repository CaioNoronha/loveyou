import UIKit

public final class LoveViewController: UIViewController {
    
    private var viewModel: ViewModel?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    public override func loadView() {
        view = LoveView(viewOwner: self)
        viewModel = ViewModel(calendarLove: LoveFactory.createLove())
        setupNavigation()
    }
    
    private func setupNavigation() {
        let backgroundImage = UIImageView(image: UIImage(named: "background"))
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
}

extension LoveViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.calendarLove.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoveCell", for: indexPath) as? LoveCell else {
            return UICollectionViewCell()
        }
        
        if let love = viewModel?.calendarLove[indexPath.row] {
            cell.configure(image: UIImage(named: "lock"), title: love.titleDate)
            print(love.isAvailable)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}


extension LoveViewController {
    public struct ViewModel {
        let calendarLove: [Love]
    }
}

public typealias CollectionOwner = UICollectionViewDelegate & UICollectionViewDataSource

