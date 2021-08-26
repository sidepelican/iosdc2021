import SwiftUI

struct Itemize: View {
    var items: [String]

    init(items: [String]) {
        self.items = items
    }

    init(@StringsBuilder items: () -> [String]) {
        self.items = items()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "circle.fill")
                        .scaleEffect(0.5)
                        .foregroundColor(Color(white: 0x33 / 0xFF))
                    Text("\(item)")
                }
            }
            .font(.default(size: 42))
        }
        .padding(.vertical, 2)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

@resultBuilder
struct StringsBuilder {
    static func buildBlock(_ components: String...) -> [String] {
        components
    }
}
