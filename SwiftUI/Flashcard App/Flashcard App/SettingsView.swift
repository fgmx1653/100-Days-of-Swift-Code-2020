import SwiftUI
import StoreKit
import MessageUI

struct SettingsView: View {
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    @State private var isShowingMailView = false
    @Binding var isSettingsOpen: Bool
    
    var body: some View {
        ZStack {
            NavigationView {
                Form {
                    Section(header: Text("Feedback").font(.title).bold()) {
                        SectionButton(image: "star.circle.fill", label: "Rate this app", isShowingMailView: $isShowingMailView)
                        
                        #if targetEnvironment(macCatalyst)
                            EmptyView()
                        #else
                            SectionButton(image: "envelope.circle.fill", label: "Send feedback", isShowingMailView: $isShowingMailView)
                        #endif
                    }
                    
                    Section(header: Text("About this app").font(.title).bold()) {
                        Text("This app was developed to help with my kids as they practiced learning their sight words.")
                    }
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        Button(action: {
                            self.isSettingsOpen.toggle()
                        }) {
                            Text("Dismiss")
                        }
                    }
                }
                .navigationBarTitle("Settings")
            }
            
            if (isShowingMailView) {
                mailView()
                    .transition(.move(edge: .bottom))
                    .animation(.default)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func mailView() -> some View {
        MFMailComposeViewController.canSendMail() ?
            AnyView(MailView(isShowing: $isShowingMailView, result: $result)) :
            AnyView(Text("Can't send emails from this device"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(isSettingsOpen: Binding.constant(true))
        }
    }
}

struct SectionButton: View {
    let image: String
    let label: String
    
    @Binding var isShowingMailView: Bool
    
    var body: some View {
        Button(action: buttonAction) {
            HStack {
                Image(systemName: image)
                    .font(.title)
                Text(label)
                    .foregroundColor(Color(.label))
            }
        }
    }
    
    func buttonAction() {
        if label == "Rate this app" {
            SKStoreReviewController.requestReview()
        } else {
            self.isShowingMailView.toggle()
        }
    }
}

//MARK: - Mail view
struct MailView: UIViewControllerRepresentable {
    
    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(isShowing: Binding<Bool>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                isShowing = false
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing,
                           result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        
        let emailSubjectText = "Daily Sight Words Feedback"
        let emailText = "Please write your feedback here."
        let alertTitle = "Sign in to mail"
        let alertMessage = "You are currently not signed into the email application on your iOS device. Please sign in if you wish to send us feedback."
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = context.coordinator
        
        if MFMailComposeViewController.canSendMail() {
            composeVC.setToRecipients(["calebrwells@gmail.com"])
            composeVC.setSubject(emailSubjectText)
            composeVC.setMessageBody(emailText, isHTML: false)
        } else {
            let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(OKAction)
            UIApplication.shared.windows.first?.rootViewController?.present(alertController, animated: true, completion:nil)
        }
        
        return composeVC
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
    }
}
