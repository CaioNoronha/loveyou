import Cartography
import UIKit

public final class LoveCell: UICollectionViewCell {
    
    //MARK: - Attributes
        
    public lazy var loveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    private var viewModel: ViewModel?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func setup() {
        build()
        setupConstrains()
    }
    
    private func build() {
        contentView.addSubview(loveImageView)
        contentView.addSubview(titleLabel)
    }
    
    public func configure(image: UIImage?, title: String) {
        loveImageView.image = image
        titleLabel.text = title
    }
    
    private func setupConstrains() {
        constrain(loveImageView, contentView) { image, view in
            image.top == view.top
            image.leading == view.leading
            image.trailing == view.trailing
            image.height == 170
        }
        
        constrain(titleLabel, loveImageView, contentView) { title, image, view in
            title.top == image.bottom - 80
            title.leading == view.leading
            title.trailing == view.trailing
            title.bottom == view.bottom
        }
    }
}

extension LoveCell {
    public struct ViewModel {
        let title: String
        let image: UIImage
    }
}
