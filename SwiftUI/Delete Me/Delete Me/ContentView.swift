//
//  ContentView.swift
//  Delete Me
//
//  Created by Caleb Wells on 5/20/20.
//  Copyright © 2020 Caleb Wells. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            FirstView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
            }
            .tag(0)
            
            Text("Plan View")
                .font(.title)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Plan")
            }
            .tag(1)
            
            Text("Record View")
                .font(.title)
                .tabItem {
                    Image(systemName: "circle")
                    Text("Record")
            }
            .tag(2)
            
            Text("History View")
                .font(.title)
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
            }
            .tag(3)
            
            Text("Profile View")
                .font(.title)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
            }
            .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FirstView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                SearchHeader()
                
                HStack {
                    Text("Top trails nearby")
                        .font(.title)
                        .bold()
                        .padding([.top, .horizontal])
                    
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 5) { card in
                            CardView()
                        }
                        .padding(.leading)
                        .padding(.trailing, 8)
                    }
                }
                
                HStack {
                    Text("Best views nearby")
                        .font(.title)
                        .bold()
                        .padding([.top, .horizontal])
                    
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 5) { card in
                            CardView()
                        }
                        .padding(.leading)
                        .padding(.trailing, 8)
                    }
                }
            }
            .navigationBarTitle("Good afternoon")
        }
    }
}

struct SearchHeader: View {
    @State private var search = ""
    let buttons = ["slider.horizontal.3", "map"]
    
    var body: some View {
        
        HStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color(.secondarySystemFill))
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding()
                    
                    TextField("Enter a city, park or trail", text: $search)
                }
            }
            .padding()
            
            ForEach(buttons, id: \.self) { button in
                Button(action: {
                    //
                }) {
                    Image(systemName: button)
                        .rotationEffect(Angle(degrees: button != "map" ? 90 : 0))
                        .foregroundColor(Color(.label))
                        .padding()
                    
                }
                
            }
        }
        .frame(height: 60)
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(y: 24)
                .frame(width: 270, height: 100)
                .clipped()
                .overlay(ImageButtonView(), alignment: .topTrailing)
            
            VStack {
                HStack {
                    Text("Great views!")
                    Spacer()
                }
                
                HStack {
                    Text("Place name")
                        .font(.caption)
                    Spacer()
                }
                
                HStack {
                    Text("easy")
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 12)
                        .background(Color.green)
                        .cornerRadius(8)
                    
                    ForEach(0 ..< 5) { _ in
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                    
                    Text("(227)")
                        .font(.caption)
                    
                    Spacer()
                }
                
                HStack {
                    Text("Length: 27.87 mi • Est. 4h 12m")
                        .font(.caption)
                    Spacer()
                    
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "arrow.down.circle")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .frame(width: 270)
        .background(Color(.secondarySystemFill))
        .cornerRadius(8)
    }
}

struct ImageButtonView: View {
    @State private var isTapped = false
    
    var body: some View {
        Button(action: {
            self.isTapped.toggle()
        }) {
            Image(systemName: isTapped ? "heart.fill" : "heart")
                .foregroundColor(isTapped ? .green : .white)
                .padding()
        }
    }
}
