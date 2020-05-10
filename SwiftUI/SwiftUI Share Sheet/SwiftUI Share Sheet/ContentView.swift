import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: share) {
            Image(systemName: "square.and.arrow.up")
                .font(.largeTitle)
        }
    }
    
    func share() {
        let url = URL(string: "https://apple.com")
        let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(activityView, animated: true, completion: nil)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            activityView.popoverPresentationController?.sourceView = UIApplication.shared.windows.first
            activityView.popoverPresentationController?.sourceRect = CGRect(
                x: UIScreen.main.bounds.width / 2.1,
                y: UIScreen.main.bounds.height / 2.3,
                width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
