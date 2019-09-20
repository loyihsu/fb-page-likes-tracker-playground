import Cocoa

/// Track the changes of Facebook page likes with mere html access to the page
// Facebook would block your access when you access it too often. This code attempts to keep the function going with a Timer.

// MARK: - Setup
let trackTitle = "柯文哲"
let theURL = "https://www.facebook.com/DoctorKoWJ/" // https://www.facebook.com/THE_PAGE_TO_TRACK or https://zh-tw.facebook.com/THE_PAGE_TO_TRACK would both work.
let interval: Double = 5 // Minutes

// MARK: - Initialise
var prev = ""
var currentMax = 0

print("Facebook Page Likes Quicktrack: \(trackTitle) (Loyiworks)")  // Announce title

//MARK: - Model

func getTheInfo() {
    do {
        if let url = validURL(theURL) {
            let html = try String.init(contentsOf: url)
            if let p = html.range(of: #"<div>(\d|,)+ 人說這讚<\/div>"#, options: .regularExpression) {
                if let q = html[p].firstIndex(of: "人") {
                    let s = html[html.index(p.lowerBound, offsetBy: 5)..<html.index(before: q)]
                    let t = Int(s.components(separatedBy: ",").joined())!
                    if currentMax == 0 { currentMax = t }       // update current max only when current Max is 0
                    
                    print("\(getCurrrentDateTime()) - \(s) (\(t - currentMax))")
                }
            }
        }
    } catch {
        // Error handling
    }
}

// MARK: - Run
let t = Timer.init(timeInterval: interval*60, repeats: true) { (t) in
    getTheInfo()
}

getTheInfo()
RunLoop.main.add(t, forMode: .common)
