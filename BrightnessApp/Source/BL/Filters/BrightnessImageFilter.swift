//
//  BrightnessImageFilter.swift
//  BrightnessApp
//
//  Created by Ромка Бережной on 28.07.2023.
//

import MetalPetal
import Foundation


final class BrightnessImageFilter: ImageFilter {
    
    func apply(to image: UIImage, intensivity: Float) -> UIImage? {
        let filter = CustomBrightnessFilter()
        let inputImage: MTIImage = .init(image: image, isOpaque: true)
        
        filter.brightness = intensivity
        filter.inputImage = inputImage
        
        guard let outputImage: MTIImage = filter.outputImage,
              let device = MTLCreateSystemDefaultDevice(),
              let context = try? MTIContext(device: device),
              let cgImage: CGImage = try? context.makeCGImage(from: outputImage)
        else {
            return nil
        }
        
        return .init(cgImage: cgImage)
    }
}
