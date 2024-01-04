import UIKit

public final class LoveCell: UICollectionViewCell {
    
    //MARK: - Attributes
        
    public lazy var loveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
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
    
    public func configure(image: UIImage, title: String) {
        loveImageView.image = image
        titleLabel.text = title
    }
    
    private func setupConstrains() {
        
    }
}

extension LoveCell {
    public struct ViewModel {
        let title: String
        let image: UIImage
    }
}
