import Cartography
import UIKit

protocol HomeViewProtocol {
    func reloadData()
}

public final class HomeView: UIView, HomeViewProtocol {
    
    //MARK: - Attributes
    
    private lazy var homeCards : UITableView = {
        let tableView = UITableView()
        tableView.register(BannerCell.self, forCellReuseIdentifier: "BannerCell")
        tableView.register(EventCell.self, forCellReuseIdentifier: "EventCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 126
        tableView.backgroundColor = UIColor(named: "background")
        return tableView
    }()
    
    //MARK: - Initialize
    
    public init(viewOwner: HomeViewOwner) {
        super.init(frame: .zero)
        register(viewOwner: viewOwner)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    //MARK: - Methods
    
    private func register(viewOwner: HomeViewOwner) {
        homeCards.dataSource = viewOwner
        homeCards.delegate = viewOwner
    }
    
    private func setup() {
        build()
        setupConstrains()
        backgroundColor = UIColor(named: "background")
    }
    
    private func build() {
        addSubview(homeCards)
    }
    
    public func reloadData() {
        homeCards.reloadData()
    }
    
    private func setupConstrains() {        
        constrain(homeCards, self) { tableView, view in
            tableView.leading == view.leading
            tableView.trailing == view.trailing
            tableView.top == view.safeAreaLayoutGuide.top
            tableView.bottom == view.safeAreaLayoutGuide.bottom
        }
    }
}
