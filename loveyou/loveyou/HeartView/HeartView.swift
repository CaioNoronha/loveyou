import Cartography
import UIKit

public final class HeartView: UIView {
        
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public lazy var backgroundView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //MARK:- Initializer
    public init(image: UIImage, background: UIImage) {
        super.init(frame: .zero)
        imageView.image = image
        backgroundView.image = background
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    
    //MARK: - Methods
    
    private func setup() {
        build()
        setupConstrains()
    }
    
    private func build() {
        insertSubview(backgroundView, at: 0)
        addSubview(imageView)
    }

    private func setupConstrains() {
        constrain(backgroundView, self) { image, view in
            image.edges == view.edges
        }
        
        constrain(imageView, self) { image, view in
            image.edges == view.edges
        }
    }
}
