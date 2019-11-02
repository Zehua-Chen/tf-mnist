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
                .frame(minWidth: 180, minHeight: 180, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().strokeBorder(Color.white, lineWidth: 4))
                .shadow(radius: 2.0)
                .padding(.init(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0))


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
        PredictionView(prediction: Prediction(image: #imageLiteral(resourceName: "test-image-28"), predictedClass: "T-Shirt"))
    }
}
