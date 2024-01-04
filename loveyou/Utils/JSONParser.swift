import Foundation

public final class JSONParser {
    
    public init() { }

    // Returns a Data containing a representation of the String encoded using a given encoding.
    
    /// This method will parse a JSON file, retrieving its data in a Swift usable way.
    /// - Parameters:
    ///   - data: The data containing a representation of the JSON contents.
    ///   - type: The data type used to decode the JSON content. Note that the type must have at least one or more attributes, and they must be equal as the attributes from the JSON file.
    /// - Returns: The decoded data casted as the type parameter type.
    /// - Throws: An error indicating that the file could not be decoded.
    public static func parse<T: Decodable>(_ data: Data, from type: T.Type) throws -> T {
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
            
        } catch {
            throw JSONParsingError.JSONFileCouldNotBeDecoded(type: T.self, error: error)
        }
    }
    
    /// This method will read a file from the app main bundle and return it if it exists.
    /// - Parameter fileName: The name of the file on the main Bundle.
    /// - Returns: A Data structure associated with the contents of given JSON file.
    /// - Throws: An error indicating that the file could not be found on the main bundle or transformed into a Data structure.
    public static func read(bundle: Bundle, fileNamed fileName: String) throws -> Data {
        guard let filepath = bundle.path(forResource: fileName, ofType: "json") else {
            throw JSONParsingError.JSONfileNotFound(fileName: fileName)
        }
        
        let fileContent = try String(contentsOfFile: filepath)
        
        guard let fileData = fileContent.data(using: .utf8) else {
            throw JSONParsingError.JSONFileFailedToTransformIntoData
        }
        
        return fileData
    }
}

extension JSONParser {
    
    enum JSONParsingError: LocalizedError {
        case JSONfileNotFound(fileName: String)
        case JSONFileFailedToTransformIntoData
        case JSONFileCouldNotBeDecoded(type: Any, error: Error)
        
        public var errorDescription: String? {
            switch self {
            case .JSONfileNotFound(fileName: let fileName):
                return NSLocalizedString(
                    "The file `\(fileName)` could not be found on the App`s main bundle.",
                    comment: "JSON file not found"
                )
            case .JSONFileCouldNotBeDecoded(type: let type, error: let error):
                return NSLocalizedString(
                    """
                    JSONParser: Could not decode JSON file using `\(type.self).self`. Check if the class/struct attributes match JSON file attributes. See the error message below for more info:
                    
                    \(error)
                    """,
                    comment: "Could not decode JSON file"
                )
            case .JSONFileFailedToTransformIntoData:
                return NSLocalizedString(
                    "An error occured while trying to transform file content into a `Foundation.Data` structure.",
                    comment: "Error transforming into Data structure"
                )
            }
        }
    }
}

extension Bundle {
    func dataFromResource(_ resource: String) -> Data {
        guard let mockURL = url(forResource: resource,
                                withExtension: "json"),
              let data = try? Data(contentsOf: mockURL) else {
                 fatalError("Failed to load \(resource) from bundle.")
        }
        return data
    }
}
