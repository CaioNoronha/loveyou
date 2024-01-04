import Foundation

public protocol HomePresentationLogic {
    func presentData(_ data: HomeData)
    func presentError()
    func didSelectedCard(_ name: String)
}

public final class HomePresenter: HomePresentationLogic {
    
    public weak var view: HomeDisplayLogic?
    private var router: HomeRouterDelegate?
    
    public init (router: HomeRouterDelegate) {
        self.router = router
    }
    
    public func presentData(_ data: HomeData) {
        let homeData = convertData(data)
        view?.presentData(viewModel: homeData)
    }
    
    public func presentError() {
        view?.presentError()
    }
    
    public func didSelectedCard(_ name: String) {
        router?.navigateToCard(name: name)
    }
    
    private func convertData(_ data: HomeData) -> HomeViewController.ViewModel {
        HomeViewController.ViewModel(banners: data.banners, events: data.events)
    }
}
