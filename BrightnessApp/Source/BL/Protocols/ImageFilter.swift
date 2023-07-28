//
//  ImageFilter.swift
//  BrightnessApp
//
//  Created by Ромка Бережной on 28.07.2023.
//

import UIKit
import Foundation


protocol ImageFilter {
    func apply(to image: UIImage, intensivity: Float) -> UIImage?
}
