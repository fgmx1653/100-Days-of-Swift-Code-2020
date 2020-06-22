//
//  ContentView.swift
//  SwiftUI Fullscreen Modal
//
//  Created by Caleb Wells on 6/22/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isFullScreen = false
    @State private var isNotFullScreen = false
    
    var body: some View {
        HStack {
            Text("Hello, Not full screen!")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .sheet(isPresented: $isNotFullScreen) {
                    NotFullScreen(isNotFullScreen: $isNotFullScreen)
                }
                .onTapGesture {
                    isNotFullScreen.toggle()
                }
            
            Text("Hello, full screen!")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .fullScreenCover(isPresented: $isFullScreen) {
                    FullScreen(isFullScreen: $isFullScreen)
                }
                .onTapGesture {
                    isFullScreen.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - New .swift file.
struct NotFullScreen: View {
    @Binding var isNotFullScreen: Bool
    
    var body: some View {
        Text("This is not full screen.")
            .onTapGesture {
                isNotFullScreen.toggle()
            }
    }
}

//MARK: - New .swift file.
struct FullScreen: View {
    @Binding var isFullScreen: Bool
    
    var body: some View {
        Text("This is full screen!!")
            .onTapGesture {
                isFullScreen.toggle()
            }
    }
}
