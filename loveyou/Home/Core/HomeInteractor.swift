import Foundation

public protocol HomeBusinessLogic {
    func fetchCards()
    func didSelectedCard(name: String)
}

public final class HomeInteractor: HomeBusinessLogic {
    
    private let presenter: HomePresentationLogic?
    private let worker: HomeWorkerProtocol?
    
    public init(presenter: HomePresentationLogic, worker: HomeWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    public func fetchCards() {
        worker?.fetchResultsData(completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.presenter?.presentData(data)
                
            case .failure(_):
                self?.presenter?.presentError()
            }
        })
    }
    
    public func didSelectedCard(name: String) {
        presenter?.didSelectedCard(name)
    }
}
