//
//  ContentView.swift
//  SwiftUI Link to the web
//
//  Created by Caleb Wells on 6/22/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            Link("This is a link to the web!!!", destination: URL(string: "https://www.apple.com")!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
