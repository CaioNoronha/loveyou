import Foundation

public protocol NetworkManagerProtocol {
    func executeRequest(request: String, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

public enum NetworkError: Error {
    case invalidUrl
    case invalidData
}

public struct NetworkManagerMock: NetworkManagerProtocol {
        
    public init() { }
        
    public func executeRequest(request: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        guard let response = try? JSONParser.read(bundle: Bundle.module, fileNamed: request) else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }
        
        completion(.success(response))
    }
}
