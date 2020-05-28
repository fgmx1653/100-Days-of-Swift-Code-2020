import SwiftUI

struct AddCardView: View {
    @State private var label = ""
    let colors = [Color.red, Color.blue, Color.orange, Color.purple]
    let images = ["house", "briefcase", "car", "flame", "cart", "bed.double"]

    @Binding var isAddViewShowing: Bool
    
    var body: some View {
        Form {
            Section(header: Text("New Card").font(.title).bold()) {
                TextField("Category", text: $label)
            }
            imagePicker()
            colorPicker()
            
            Button(action: {
                self.isAddViewShowing.toggle()
            }) {
                Text("Add")
            }
        }
    }
    
    func imagePicker() -> some View {
        Section(header: Text("Pick an image")) {
            HStack {
                ForEach(images, id: \.self) { image in
                    Button(action: {
                        //
                    }) {
                        Image(systemName: image)
                            .foregroundColor(Color(.label))
                    }
                    .padding()
                }
            }
        }
    }
    
    func colorPicker() -> some View {
        Section(header: Text("Pick a color")) {
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button(action: {
                        //
                    }) {
                        Circle()
                            .foregroundColor(color)
                    }
                }
            }
        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView(isAddViewShowing: Binding.constant(true))
    }
}
