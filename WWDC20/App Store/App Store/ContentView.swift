import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                TopPageView()
                HStack {
                    Text("Popualr Apps")
                        .font(.title)
                        .bold()
                        .padding(.leading)
                    Spacer()
                }
                AppPageView()
            }
            .navigationTitle("Apps")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - New .swift file.
struct TopPageView: View {
    var body: some View {
        TabView {
            ForEach(0 ..< 5) { _ in
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Some App")
                                .bold()
                            Text("Details and stuff")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                }
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 270)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

//MARK: - New .swift file.
struct AppPageView: View {
    var body: some View {
        TabView {
            ForEach(0 ..< 5) { _ in
                VStack {
                    AppCellView()
                    AppCellView()
                    AppCellView()
                }
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 270)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

//MARK: - New .swift file.
struct AppCellView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text("Some App")
                    .bold()
                Text("Details and stuff")
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            Image(systemName: "icloud.and.arrow.down")
                .font(.title)
        }
    }
}
