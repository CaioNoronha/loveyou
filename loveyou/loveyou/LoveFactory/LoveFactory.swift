import UIKit

public final class LoveFactory {
    
    
    public static func createLove() -> [Love] {
        
        //Jan
        let janDate = convertToDate("2024-01-05")
        let janIsAvailable = dateComparator(date: janDate)
        
        let jan = Love(titleDate: "Janeiro", cellImage: UIImage(), isAvailable: janIsAvailable, description: "description", photo:  UIImage())
        
        //Feb
        let febDate = convertToDate("2024-02-05")
        let febIsAvailable = dateComparator(date: febDate)
        
        let feb = Love(titleDate: "Fevereiro", cellImage: UIImage(), isAvailable: febIsAvailable, description: "description", photo:  UIImage())
        
        //Mar
        let marDate = convertToDate("2024-03-05")
        let marIsAvailable = dateComparator(date: marDate)
        
        let mar = Love(titleDate: "Março", cellImage: UIImage(), isAvailable: marIsAvailable, description: "description", photo:  UIImage())
        
        //Apr
        let aprDate = convertToDate("2024-04-05")
        let aprIsAvailable = dateComparator(date: aprDate)
        
        let apr = Love(titleDate: "Abril", cellImage: UIImage(), isAvailable: aprIsAvailable, description: "description", photo:  UIImage())
        
        //May
        let mayDate = convertToDate("2024-05-05")
        let mayIsAvailable = dateComparator(date: mayDate)
        
        let may = Love(titleDate: "Maio", cellImage: UIImage(), isAvailable: mayIsAvailable, description: "description", photo:  UIImage())
        
        //Jun
        let junDate = convertToDate("2024-06-05")
        let junIsAvailable = dateComparator(date: junDate)
        
        let jun = Love(titleDate: "Junho", cellImage: UIImage(), isAvailable: junIsAvailable, description: "description", photo:  UIImage())
        
        //Jul
        let julDate = convertToDate("2024-07-05")
        let julIsAvailable = dateComparator(date: julDate)
        
        let jul = Love(titleDate: "Julho", cellImage: UIImage(), isAvailable: julIsAvailable, description: "description", photo:  UIImage())
        
        //Ago
        let agoDate = convertToDate("2024-08-05")
        let agoIsAvailable = dateComparator(date: agoDate)
        
        let ago = Love(titleDate: "Julho", cellImage: UIImage(), isAvailable: agoIsAvailable, description: "description", photo:  UIImage())
        
        //Set
        let setDate = convertToDate("2024-09-05")
        let setIsAvailable = dateComparator(date: setDate)
        
        let set = Love(titleDate: "Setembro", cellImage: UIImage(), isAvailable: setIsAvailable, description: "description", photo:  UIImage())
        
        //Out
        let outDate = convertToDate("2024-10-05")
        let utIsAvailable = dateComparator(date: outDate)
        
        let out = Love(titleDate: "Outubro", cellImage: UIImage(), isAvailable: utIsAvailable, description: "description", photo:  UIImage())
        
        //Nov
        let novDate = convertToDate("2024-11-05")
        let novIsAvailable = dateComparator(date: novDate)
        
        let nov = Love(titleDate: "Novembro", cellImage: UIImage(), isAvailable: novIsAvailable, description: "description", photo:  UIImage())
        
        //Dez
        let dezDate = convertToDate("2024-12-05")
        let dezIsAvailable = dateComparator(date: dezDate)
        
        let dez = Love(titleDate: "Dezembro", cellImage: UIImage(), isAvailable: dezIsAvailable, description: "description", photo:  UIImage())
        
        return [jan, feb, mar, apr, may, jun, jul, ago, set, out, nov, dez]
    }
    
    
    
    private static func convertToDate(_ text: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
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
}

