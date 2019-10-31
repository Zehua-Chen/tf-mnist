//
//  Prediction.swift
//  MNIST iOS
//
//  Created by Zehua Chen on 10/31/19.
//

import UIKit

struct Prediction {
    var predictedClass: String
    var image: UIImage

    fileprivate static var _classes: [String] = [
        "T-shirt/top",
        "Trouser",
        "Pullover",
        "Dress",
        "Coat",
        "Sandal",
        "Shirt",
        "Sneaker",
        "Bag",
        "Ankle boot"
    ]

    init(image: UIImage, predictedClass: String) {
        self.image = image
        self.predictedClass = predictedClass
    }

    init(image: UIImage, rawPredictionClasses: [Float]) {
        self.image = image

        guard !rawPredictionClasses.isEmpty else {
            self.predictedClass = "?"
            return
        }

        var max = rawPredictionClasses[0]
        var maxIndex = 0

        for i in 0..<rawPredictionClasses.count {
            if rawPredictionClasses[i] > max {
                maxIndex = i
                max = rawPredictionClasses[i]
            }
        }

        self.predictedClass = Prediction._classes[maxIndex]
    }
}
