import Foundation

public final class Converter {
    
    public init() { }
    
    public static func convertToPrice(_ value: Float) -> String {
        guard value > .zero else { return "Grátis" }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    public static func convertToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "pt_BR")
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
    
    public static func convertToDate(text: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
                
        guard let date = formatter.date(from: text) else {
            return Date()
        }
        return date
    }
}
