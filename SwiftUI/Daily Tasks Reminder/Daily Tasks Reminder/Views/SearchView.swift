import SwiftUI

struct SearchView: View {
    @State private var search = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(.secondarySystemFill))
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding()
                
                TextField("Search", text: $search)
                    .padding(.vertical, 8)
                Spacer()
            }
        }
        .frame(height: 44)
        .padding([.top, .horizontal])
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
