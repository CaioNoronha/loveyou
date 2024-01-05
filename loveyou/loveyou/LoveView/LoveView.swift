import Cartography
import UIKit

public final class LoveView: UIView {
            
    public lazy var titleView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "title")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public lazy var loveCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 25
        layout.itemSize = CGSize(width: 100, height: 170)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(LoveCell.self, forCellWithReuseIdentifier: "LoveCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    public lazy var backgroundView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //MARK:- Initializer
    public init(viewOwner: CollectionOwner) {
        super.init(frame: .zero)
        setup()
        register(viewOwner: viewOwner)
    }
    
    required init?(coder: NSCoder) { nil }
    
    
    //MARK: - Methods
    private func setup() {
        build()
        setupConstrains()
    }
    
    private func build() {
        addSubview(titleView)
        addSubview(loveCollection)
        insertSubview(backgroundView, at: 0)
    }

    private func setupConstrains() {
        constrain(titleView, self) { titleView, view in
            titleView.top == view.safeAreaLayoutGuide.top
            titleView.leading == view.leading + 32
            titleView.trailing == view.trailing - 32
            titleView.height == 150
        }
        
        constrain(backgroundView, self) { image, view in
            image.edges == view.edges
        }
        
        constrain(loveCollection, titleView, self) { collection, title, view in
            collection.top == title.bottom
            collection.leading == view.leading + 12
            collection.trailing == view.trailing - 12
            collection.bottom == view.bottom
        }
    }
    
    private func register(viewOwner: CollectionOwner) {
        loveCollection.delegate = viewOwner
        loveCollection.dataSource = viewOwner
    }
    
}
