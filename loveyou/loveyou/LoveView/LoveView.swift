import UIKit

public final class LoveView: UIView {
    
    
    public lazy var loveCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(LoveCell.self, forCellWithReuseIdentifier: "LoveCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
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
        addSubview(loveCollection)
        backgroundColor = .red
    }
    
    private func setupConstrains() {
        
    }
    
    private func register(viewOwner: CollectionOwner) {
        loveCollection.delegate = viewOwner
        loveCollection.dataSource = viewOwner
    }
    
}
