import Foundation

public func getCurrrentDateTime() -> String {
    let date = Date()
    let calendar = Calendar.current
    
    let dat     = calendar.component(.day, from: date)
    let hours   = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let seconds = calendar.component(.second, from: date)
    
    return "\(dat) - \(hours):\((minutes < 10) ? "0\(minutes)" : "\(minutes)"):\((seconds < 10) ? "0\(seconds)": "\(seconds)")"
}

public func validURL(_ url: String) -> URL? {
    let format = "https://zh-tw.facebook.com/"
    
    if url.components(separatedBy: format).count > 1 {
        return URL(string: url)
    }
    
    let k = url.components(separatedBy: "https://www.facebook.com/")
    if  k.count > 1 { return URL(string: format+k.joined()) }
    
    return nil
}
 
