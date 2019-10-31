//
//  ContentView.swift
//  MNIST iOS
//
//  Created by Zehua Chen on 10/31/19.
//

import SwiftUI
import TensorFlowLite

struct ContentView: View {
    @State
    var prediction: Prediction? = nil

    @State
    var showImageSelectionView: Bool = false

    var body: some View {
        VStack {
            if self.prediction != nil {
                PredictionView(prediction: self.prediction!)
                Divider()
            }

            Button("Make Prediction") {
                self.showImageSelectionView.toggle()
            }
            .padding(.vertical)
            .sheet(isPresented: self.$showImageSelectionView) {
                ImageSelectionView(onDone: { image in
                    if image != nil {
                        self.predict(for: image!)
                    }

                    self.showImageSelectionView = false
                })
            }
        }
        .padding(.horizontal)
    }

    func predict(for image: UIImage) {
        let classifier = ImageClassifier()
        classifier.classifyImage(image, completionHandler: { prediction in
            self.prediction = prediction
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
