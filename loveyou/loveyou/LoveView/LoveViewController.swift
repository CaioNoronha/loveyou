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
        self.navigationItem.backButtonTitle = "Amor Agendado"
        self.navigationController?.navigationBar.tintColor = .red
    }
}

extension LoveViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let love = viewModel?.calendarLove[indexPath.row], love.isAvailable  {
            
            let heartView = HeartViewController(heartImage: love.photo, heartBackground: love.background)
            
            navigationController?.pushViewController(heartView, animated: true)
        }
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.calendarLove.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoveCell", for: indexPath) as? LoveCell else {
            return UICollectionViewCell()
        }
        
        if let love = viewModel?.calendarLove[indexPath.row] {
            
            var loveImage: UIImage
            
            if love.isAvailable {
                loveImage = love.cellImage
            } else {
                loveImage = UIImage(named: "box_locked") ?? UIImage()
            }
            
            cell.configure(image: loveImage, title: love.titleDate)
            
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

