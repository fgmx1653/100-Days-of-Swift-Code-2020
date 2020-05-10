import SwiftUI

struct ContentView: View {
    @State private var suspects = [String]()
    @State private var weapons = [String]()
    @State private var rooms = [String]()
    @State private var isThemeListOpen = false
    
    var body: some View {
        NavigationView {
            if suspects.isEmpty {
                HStack {
                    Text("Tap the ")
                    Image(systemName: "text.badge.plus").foregroundColor(.blue)
                    Text("button to get started.")
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("My clues")
                .navigationBarItems(trailing: AddButton(isThemeListOpen: $isThemeListOpen))
                .sheet(isPresented: $isThemeListOpen) {
                    ThemeListView(suspects: self.$suspects, weapons: self.$weapons, rooms: self.$rooms, isThemeListOpen: self.$isThemeListOpen)
                }
            } else {
                List {
                    Section(header: Text("Suspects").font(.title).bold()) {
                        ForEach(suspects, id: \.self) { suspect in
                            Text(suspect)
                        }
                    }
                    Section(header: Text("Weapons").font(.title).bold()) {
                        ForEach(weapons, id: \.self) { weapon in
                            Text(weapon)
                        }
                    }
                    Section(header: Text("Rooms").font(.title).bold()) {
                        ForEach(rooms, id: \.self) { room in
                            Text(room)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("My clues")
                .navigationBarItems(trailing: AddButton(isThemeListOpen: $isThemeListOpen))
                .sheet(isPresented: $isThemeListOpen) {
                    ThemeListView(suspects: self.$suspects, weapons: self.$weapons, rooms: self.$rooms, isThemeListOpen: self.$isThemeListOpen)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AddButton: View {
    @Binding var isThemeListOpen: Bool
    
    var body: some View {
        Button(action: {
            self.isThemeListOpen.toggle()
        }) {
            Image(systemName: "text.badge.plus")
                .font(.title)
        }
    }
}

struct ThemeListView: View {
    @Binding var suspects: [String]
    @Binding var weapons: [String]
    @Binding var rooms: [String]
    @Binding var isThemeListOpen: Bool
    
    var body: some View {
        VStack {
            ThemeListButtonHeaderView(suspects: $suspects, weapons: $weapons, rooms: $rooms, isThemeListOpen: $isThemeListOpen)
            if suspects.isEmpty {
                VStack {
                    HStack {
                        Text("Tap the ")
                        Image(systemName: "plus.circle").foregroundColor(.blue)
                        Text("button to get started.")
                    }
                    Spacer()
                }
            } else {
                List {
                    Text("Theme One")
                }
            }
        }
    }
}

struct ThemeListButtonHeaderView: View {
    @Binding var suspects: [String]
    @Binding var weapons: [String]
    @Binding var rooms: [String]
    @Binding var isThemeListOpen: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                self.suspects.append("Jony Ive")
                self.weapons.append("Mac Pro")
                self.rooms.append("The white room")
            }) {
                Image(systemName: "plus.circle")
                    .font(.title)
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                self.isThemeListOpen.toggle()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
            .padding()
        }
    }
}
