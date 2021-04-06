import Foundation

let formatter = DateFormatter()

public func getCurrrentDateTime() -> String {
    let date = Date()
    formatter.dateFormat = "YYYY/MM/dd (HH:mm:ss)"
    return "\(formatter.string(from: date))"
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
