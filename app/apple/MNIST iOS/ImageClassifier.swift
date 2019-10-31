//
//  ImageClassifier.swift
//  MNIST iOS
//
//  Created by Zehua Chen on 10/31/19.
//

import Foundation
import UIKit
import TensorFlowLite
import Dispatch

class ImageClassifier {
    static var modelPath: String = {
        guard let path = Bundle.main.path(forResource: "quantized-model", ofType: "tfmodel") else {
            fatalError("Cannot load tensorflow model")
        }

        return path
    }()

    fileprivate var _interpreter: Interpreter

    init() {
        _interpreter = try! Interpreter(modelPath: ImageClassifier.modelPath)

    }

    func classifyImage(_ image: UIImage, completionHandler: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInteractive).async {
            let inputShape = try! self._interpreter.input(at: 0).shape
            let inputWidth = inputShape.dimensions[0]
            let inputHeight = inputShape.dimensions[1]

            try! self._interpreter.allocateTensors()

            let rawImage = image.scaledBy(width: inputWidth, height: inputHeight)

            try! self._interpreter.copy(rawImage, toInputAt: 0)
            try! self._interpreter.invoke()

            let output = try! self._interpreter.output(at: 0)

            DispatchQueue.main.async {
                print("output shape = \(output.shape)")
                completionHandler()
            }
        }
    }
}
