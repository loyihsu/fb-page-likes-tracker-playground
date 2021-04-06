import Foundation

/// Track the changes of Facebook page likes with mere html access to the page
/// Facebook would block your access when you access it too often. This code attempts to keep the function going with a Timer.

typealias Minutes = Double

// MARK: - Setup
let trackTitle = "柯文哲"
let theURL = "https://www.facebook.com/DoctorKoWJ/" // https://www.facebook.com/THE_PAGE_TO_TRACK or https://zh-tw.facebook.com/THE_PAGE_TO_TRACK would both work.
let interval: Minutes = 5

// MARK: - Initialise
var prev = ""
var currentMax = 0

print("Facebook Page Likes Tracker: \(trackTitle) (Loyiworks)")  // Announce title

//MARK: - Model

func getTheInfo() {
    if let url = validURL(theURL), let html = try? String.init(contentsOf: url) {
        if let p = html.range(of: #"<div>(\d|,)+ 人說這讚<\/div>"#, options: .regularExpression) {
            if let q = html[p].firstIndex(of: "人") {
                let s = html[html.index(p.lowerBound, offsetBy: 5)..<html.index(before: q)]
                let t = Int(s.components(separatedBy: ",").joined())!
                if currentMax == 0 { currentMax = t }       // update current max only when current Max is 0
                print("\(getCurrrentDateTime()) - \(s) (\(t - currentMax))")
            } else {
                print("Error: Message not found.")
            }
        } else {
            print("Error: Specified page is not valid.")
        }
    } else {
        print("Error: Not a valid URL.")
    }
}

// MARK: - Run
let t = Timer(timeInterval: interval*60, repeats: true) { (t) in
    getTheInfo()
}

getTheInfo()
RunLoop.main.add(t, forMode: .common)
