import Cartography
import UIKit
import Utils

public class BannerCell: UITableViewCell {
    
    //MARK: - Attributes
    
    private lazy var bannerCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(BannerCollectionCell.self, forCellWithReuseIdentifier: "BannerCollectionCell")
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.backgroundColor = .clear
        return collection
    }()
    
    //MARK: - Initializer
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    //MARK: - Methods
    
    public func register(viewOwner: CollectionOwner) {
        bannerCollection.delegate = viewOwner
        bannerCollection.dataSource = viewOwner
    }
    
    private func setup() {
        build()
        setupConstrains()
        backgroundColor = UIColor(named: "background")
        selectionStyle = .none
    }
    
    private func build() {
        contentView.addSubview(bannerCollection)
    }
    
    private func setupConstrains() {
        constrain(bannerCollection, contentView) { banners, view in
            banners.leading == view.leading + 16
            banners.trailing == view.trailing - 16
            banners.top == view.top
            banners.bottom == view.bottom
        }
    }
}
