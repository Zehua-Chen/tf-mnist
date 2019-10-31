//
//  UIImage+Export.swift
//  MNIST iOS
//
//  Created by Zehua Chen on 10/31/19.
//

import Foundation
import UIKit

// Credit: https://github.com/tensorflow/examples/blob/c3d9454972cd536ef673f0f09e6ab78a2b2dd1c9/lite/examples/digit_classifier/ios/DigitClassifier/TFLiteExtensions.swift

extension UIImage {
    func scaledBy(width: Int, height: Int) -> Data? {

        guard let cgImage = self.cgImage, cgImage.width > 0, cgImage.height > 0 else { return nil }

        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let width = Int(size.width)

        guard let context = CGContext(
            data: nil,
            width: width,
            height: Int(size.height),
            bitsPerComponent: cgImage.bitsPerComponent,
            bytesPerRow: width * 1,
            space: CGColorSpaceCreateDeviceGray(),
            bitmapInfo: bitmapInfo.rawValue)
        else {
            return nil
        }

        context.draw(cgImage, in: CGRect(origin: .zero, size: size))
        guard let scaledBytes = context.makeImage()?.dataProvider?.data as Data? else { return nil }

        let scaledFloats = scaledBytes.map { Float32($0) / 255.0 }

        return Data(copyingBufferOf: scaledFloats)
    }
}

extension Data {
    /// Creates a new buffer by copying the buffer pointer of the given array.
    ///
    /// - Warning: The given array's element type `T` must be trivial in that it can be copied bit
    ///     for bit with no indirection or reference-counting operations; otherwise, reinterpreting
    ///     data from the resulting buffer has undefined behavior.
    /// - Parameter array: An array with elements of type `T`.
    init<T>(copyingBufferOf array: [T]) {
        self = array.withUnsafeBufferPointer(Data.init)
    }

    func toArray<T>(type: T.Type) -> [T] where T: ExpressibleByIntegerLiteral {
        var array = Array<T>(repeating: 0, count: self.count / MemoryLayout<T>.stride)
        _ = array.withUnsafeMutableBytes { copyBytes(to: $0) }
        return array
    }
}
