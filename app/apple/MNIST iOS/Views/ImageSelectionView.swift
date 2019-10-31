//
//  ImageSelectionView.swift
//  MNIST iOS
//
//  Created by Zehua Chen on 10/31/19.
//

import SwiftUI

struct ImageSelectionView: View {

    typealias DoneActionHandler = (_ image: UIImage?) -> Void

    var onDone: DoneActionHandler

    var body: some View {
        NavigationView {
            List(0..<40) { index in
                Button(action: {
                    let identifier = "test-image-\(index)"
                    let uiImage = UIImage(named: identifier, in: nil, compatibleWith: nil)
                    self.onDone(uiImage)
                }) {
                    HStack {
                        Image("test-image-\(index)", bundle: nil, label: Text("Some Image"))
                                .renderingMode(.original)
                        Spacer()
                        Text("Test \(index)")
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle("Select Image")
            .navigationBarItems(trailing: Button("Cancel") { self.onDone(nil) })
        }
    }
}

struct ImageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectionView(onDone: { _ in })
    }
}
