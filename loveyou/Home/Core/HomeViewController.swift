import UIKit

public protocol HomeDisplayLogic: AnyObject {
    func presentData(viewModel: HomeViewController.ViewModel?)
    func presentError()
}

public final class HomeViewController: UIViewController, HomeDisplayLogic {
    
    //MARK: - Attributes
    
    private var interactor: HomeBusinessLogic?
    private var viewModel: ViewModel?
    
    //MARK: - Initializer
    
    public init(interactor: HomeBusinessLogic?) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: - Controller Methods
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchCards()
    }
    
    required init?(coder: NSCoder) { nil }
    
    public override func loadView() {
        view = HomeView(viewOwner: self)
        setupNavigation()
    }
    
    //MARK: - Methods
    
    public func presentData(viewModel: ViewModel?) {
        guard let view = self.view as? HomeViewProtocol else { return }
        self.viewModel = viewModel
        view.reloadData()
    }
    
    public func presentError() {
        view = UIView()
        view.backgroundColor = UIColor(named: "background")
    }
    
    private func setupNavigation() {
        title = "Eventos"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: .init(systemName: "bell"),
            style: .plain,
            target: self,
            action: #selector(test)
        )
    }
    
    @objc func test() {
        print("Notificações")
    }
}

//MARK: - Delegates

extension HomeViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let name = viewModel?.banners[indexPath.row].title else { return }
                
        interactor?.didSelectedCard(name: name)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 36, height: 180)
    }
}

extension HomeViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            guard let name = viewModel?.events[indexPath.row-1].title else { return }
            interactor?.didSelectedCard(name: name)
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0  {
            return CGFloat(187)
        } else {
            return CGFloat(126)
        }
    }
}

//MARK: - DataSources

extension HomeViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.banners.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "BannerCollectionCell", for: indexPath) as? BannerCollectionCell,
              let banner = viewModel?.banners[indexPath.row] else {
            return UICollectionViewCell()
        }
                
        cell.configure(with: banner)
        
        return cell
    }
}

extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.events.count ?? 0) + 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell") as? BannerCell else {
                return UITableViewCell()
            }
            
            cell.register(viewOwner: self)
            
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as? EventCell,
                  let event = viewModel?.events[indexPath.row-1] else {
                return UITableViewCell()
            }
            
            cell.configure(with: event)
            
            return cell
        }
    }
}

//MARK: - ViewModel
extension HomeViewController {
    
    public struct ViewModel {
        let banners: [Banner]
        let events: [Event]
    }
}
