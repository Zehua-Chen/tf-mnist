//
//  PredictionView.swift
//  MNIST iOS
//
//  Created by Zehua Chen on 10/31/19.
//

import SwiftUI

struct PredictionView: View {
    var prediction: Prediction
    
    var body: some View {
        VStack.init(alignment: .center, spacing: 30.0) {
            Image(uiImage: self.prediction.image)
            HStack {
                Text("Class")
                Spacer()
                Text(self.prediction.predictedClass)
            }
        }
    }
}

struct PredictionView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionView(prediction: Prediction(predictedClass: "T-Shirt", image: UIImage(systemName: "plus")!))
            .padding()
    }
}
