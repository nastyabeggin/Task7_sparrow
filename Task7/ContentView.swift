import SwiftUI

struct ContentView: View {
    @Namespace private var namespace
    @State private var isZoomed = false
    
    var body: some View {
        VStack {
            if !isZoomed {
                Button(action: {
                    withAnimation(.smooth) {
                        isZoomed.toggle()
                    }
                }) {
                    Text("Open")
                        .foregroundColor(.white)
                        .padding()
                        .font(.title3)
                        .matchedGeometryEffect(id: "button", in: namespace)
                        .background(
                            Rectangle()
                                .clipShape(.rect(cornerRadius: 10))
                                .matchedGeometryEffect(id: "shape", in: namespace)
                                .foregroundStyle(.blue)
                        )
                }
                .offset(x: 120, y: 350)
            } else {
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .clipShape(.rect(cornerRadius: 10))
                        .matchedGeometryEffect(id: "shape", in: namespace)
                        .frame(width: 300, height: 300)
                        .foregroundStyle(.blue)
                    Button(action: {
                        withAnimation(.smooth) {
                            isZoomed.toggle()
                        }
                    }, label: {
                        Label("Back", systemImage: "arrowshape.backward.fill")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .padding()
                            .fixedSize(horizontal: true, vertical: true)
                            .matchedGeometryEffect(id: "button", in: namespace)
                    })
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
