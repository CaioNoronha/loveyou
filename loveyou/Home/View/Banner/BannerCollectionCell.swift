import Cartography
import UIKit

public class BannerCollectionCell: UICollectionViewCell {
    
    //MARK: - Attributes
    
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    //MARK: - Methods
    
    private func setup() {
        build()
        setupConstrains()
        backgroundColor = UIColor(named: "background")
    }
    
    private func build() {
        addSubview(bannerImageView)
    }
    
    public func configure(with viewModel: Banner) {
        bannerImageView.image = UIImage(named: viewModel.imageURL)
    }
    
    private func setupConstrains() {
        
        constrain(bannerImageView, self) { image, view in
            image.edges == view.edges
        }
    }
}
