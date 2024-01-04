import UIKit

public final class LoveFactory {
    
    
    public static func createLove() -> [Love] {
        
        let janDate = convertToDate("2024-01-05 00:00")
        let janIsAvailable = dateComparator(date: janDate)
        
        let jan = Love(titleDate: "Janeiro", cellImage: UIImage(), isAvailable: janIsAvailable, description: "description", photo:  UIImage())
        
        let febDate = convertToDate("2024-02-05 00:00")
        let febIsAvailable = dateComparator(date: febDate)
        
        let feb = Love(titleDate: "Fevereiro", cellImage: UIImage(), isAvailable: febIsAvailable, description: "description", photo:  UIImage())
        
        let marDate = convertToDate("2024-03-05 00:00")
        let marIsAvailable = dateComparator(date: marDate)
        
        let mar = Love(titleDate: "Março", cellImage: UIImage(), isAvailable: marIsAvailable, description: "description", photo:  UIImage())
        
        let aprDate = convertToDate("2024-04-05 00:00")
        let aprIsAvailable = dateComparator(date: aprDate)
        
        let apr = Love(titleDate: "Abril", cellImage: UIImage(), isAvailable: aprIsAvailable, description: "description", photo:  UIImage())
        
        
        return [jan, feb, mar, apr]
    }
    
    
    
    private static func convertToDate(_ text: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = formatter.date(from: text) else {
            return Date()
        }
        return date
    }
    
    private static func dateComparator(date: Date) -> Bool {
        let currentDate = Date.now
        let compare = Calendar.current.compare(currentDate, to: date, toGranularity: .day)
        
        switch compare {
            //before and today
        case .orderedDescending, .orderedSame:
            return true
            //after
        case .orderedAscending:
            return false
        }
    }
}

extension LoveFactory {
    public enum DatesType {
        case before, after, today
    }
    
    public enum Mouths {
        case jan, fev, mar, apr, may, jun, jul, ago, set, out, nov, dez
    }

}

