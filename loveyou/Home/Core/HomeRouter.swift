import UIKit

public protocol HomeRouting {
    func create() -> UIViewController
}

public protocol HomeRouterDelegate {
    func navigateToCard(name: String)
}

public final class HomeRouter: HomeRouting {
    
    public weak var view: UIViewController?
        
    public init () { }
    
    public func create() -> UIViewController {
        let presenter = HomePresenter(router: self)
        let network = NetworkManagerMock()
        let worker = HomeWorker(network: network)
        let interactor = HomeInteractor(presenter: presenter, worker: worker)
        let view = HomeViewController(interactor: interactor)
        
        presenter.view = view
        self.view = view
        
        return view
    }
}

extension HomeRouter: HomeRouterDelegate {
    
    public func navigateToCard(name: String) {
        let router: ResultsRouting = ResultsRouter()
        let resultView = router.create(config: name)
    
        view?.navigationController?.pushViewController(resultView, animated: true)
    }
}
