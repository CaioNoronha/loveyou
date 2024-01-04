import Cartography
import UIKit

public class EventCell: UITableViewCell {
    
    //MARK: - Attributes
    
    private lazy var eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    private lazy var calendarLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var locationView = EventStackView(type: .location)
    
    private lazy var priceView = EventStackView(type: .price)
    
    //MARK: - Initializer
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        addSubview(eventImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(calendarLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(locationView)
        stackView.addArrangedSubview(priceView)
    }
    
    public func configure(with viewModel: Event) {
        eventImageView.image = UIImage(named: viewModel.imageURL)
        calendarLabel.text = viewModel.calendar
        titleLabel.text = viewModel.title
        locationView.configure(text: viewModel.location)
        priceView.configure(text: formattPrice(viewModel.price))
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
    
    private func formattPrice(_ value: Float) -> String {
        guard value > .zero else { return "Grátis" }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    
    private func setupConstrains() {
        constrain(eventImageView, self) { image, view in
            image.top == view.top + 16
            image.leading == view.leading + 16
            image.bottom == view.bottom - 16
            image.width == 103
        }
        
        constrain(stackView, eventImageView) { stack, image in
            stack.top == image.top
            stack.leading == image.trailing + 8
            stack.bottom == image.bottom
        }
    }
}
