import UIKit

public enum HomeCellType {
    case location
    case price
}

public final class EventStackView: UIStackView {
    
    //MARK: - Attributes
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .top
        return icon
    }()
    
    //MARK: - Initialize
    
    public init(type: HomeCellType) {
        super.init(frame: .zero)
        setup(type)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Methods
    
    private func setup(_ type: HomeCellType) {
        setupStack()
        setupIcon(type: type)
        build()
    }
    
    private func setupStack() {
        axis = .horizontal
        alignment = .center
        spacing = 4
    }
    
    private func setupIcon(type: HomeCellType) {
        switch type {
            
        case .location:
            iconImageView.image = UIImage(systemName: "mappin")?
                .withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        case .price:
            iconImageView.image = UIImage(systemName: "ticket")?
                .withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        }
    }
    
    private func build() {
        addArrangedSubview(iconImageView)
        addArrangedSubview(titleLabel)
    }
    
    public func configure(text: String?) {
        titleLabel.text = text
    }
}
