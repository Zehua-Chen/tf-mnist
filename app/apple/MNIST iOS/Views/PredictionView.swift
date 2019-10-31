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
        VStack(alignment: .center, spacing: 10.0) {
            Image(uiImage: self.prediction.image)
                .scaleEffect(7.0, anchor: .center)
                .frame(minWidth: 200, minHeight: 200, alignment: .center)
            Divider()
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
        PredictionView(prediction: Prediction(image: UIImage(systemName: "plus")!, predictedClass: "T-Shirt"))
    }
}
