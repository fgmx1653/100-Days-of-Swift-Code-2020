import SwiftUI

struct ListView: View {
    @Binding var currentList: Int
    
    var body: some View {
        List(0 ..< 10) { listNumber in
            Button(action: {
                self.currentList = listNumber
            }) {
                HStack {
                    Text("Sight Words List #\(listNumber + 1)")
                    Spacer()
                    Image(systemName: self.currentList == listNumber ? "checkmark.circle.fill" : "")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(currentList: Binding.constant(0))
    }
}
