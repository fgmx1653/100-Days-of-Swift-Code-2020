import SwiftUI

struct CategoryCardsView: View {
    @Binding var isAddViewShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Category")
                    .bold()
                
                Spacer()
                Button(action: addButton) {
                    Image(systemName: "plus.circle")
                }
            }
            .padding()
            .font(.title)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0 ..< 5) { card in
                        CardView()
                    }
                }
            }
        }
    }
    
    func addButton() {
        isAddViewShowing.toggle()
    }
}

struct CategoryCards_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardsView(isAddViewShowing: Binding.constant(false))
    }
}
