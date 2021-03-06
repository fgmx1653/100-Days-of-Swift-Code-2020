//
//  ContentView.swift
//  SwiftUI Link to the web
//
//  Created by Caleb Wells on 6/22/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                TopPageView()
                HStack {
                    Text("Popular Apps")
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
                            Text("Read this")
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
                    AppCell()
                    AppCell()
                    AppCell()
                }
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 270)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

//MARK: - New .swift file.
struct AppCell: View {
    var body: some View {
        HStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text("App Name")
                Text("App info")
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "icloud.and.arrow.down")
                .font(.title)
                .padding(.top)
        }
        .padding(4)
    }
}
