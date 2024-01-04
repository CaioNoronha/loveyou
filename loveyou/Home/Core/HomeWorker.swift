import Foundation
import Utils

public protocol HomeWorkerProtocol {
    func fetchResultsData(completion: @escaping (Result<HomeData, NetworkError>) -> Void)
}

public final class HomeWorker: HomeWorkerProtocol {
    
    private let network: NetworkManagerProtocol?
    
    public init(network: NetworkManagerProtocol?) {
        self.network = network
    }
    
    public func fetchResultsData(completion: @escaping (Result<HomeData, NetworkError>) -> Void) {
        network?.executeRequest(request: "Home", completion: { result in
            switch result {
            case .success(let data):
                guard let homeData = try? JSONParser.parse(data, from: HomeData.self) else {
                    completion(.failure(NetworkError.invalidData))
                    return
                }
                
                completion(.success(homeData))
                
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
