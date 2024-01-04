import Cartography
import UIKit

public final class LoveView: UIView {
        
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26)
        label.text = "Amor Agendado"
        return label
    }()
    
    public lazy var loveCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        layout.estimatedItemSize = CGSize(width: 100, height: 150)
        
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
        addSubview(titleLabel)
        addSubview(loveCollection)
    }
    
    private func setupConstrains() {
        constrain(titleLabel, self) { label, view in
            label.top == view.safeAreaLayoutGuide.top
            label.leading == view.leading + 32
            label.trailing == view.trailing - 32
        }
        
        constrain(loveCollection, titleLabel, self) { collection, title, view in
            collection.top == title.bottom + 12
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
