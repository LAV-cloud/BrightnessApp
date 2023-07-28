//
//  ImageProccessingService.swift
//  BrightnessApp
//
//  Created by Ромка Бережной on 28.07.2023.
//

import UIKit
import Foundation


final class ImageProccessingService {
    private let filter: ImageFilter
    
    
    init(filter: ImageFilter) {
        self.filter = filter
    }
    
    
    func proccess(image: UIImage, intensivity: Float) -> UIImage? {
        self.filter.apply(to: image, intensivity: intensivity)
    }
}
