//
//  ImageClassifier.swift
//  MNIST iOS
//
//  Created by Zehua Chen on 10/31/19.
//

import Foundation

class ImageClassifier {
    lazy var modelPath = Bundle.main.path(forResource: "quantized-model", ofType: "tfmodel")
}
