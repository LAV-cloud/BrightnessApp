//
//  CustomMPBrightnessFilter.swift
//  BrightnessApp
//
//  Created by Ромка Бережной on 30.07.2023.
//

import MetalPetal
import Foundation


final class CustomBrightnessFilter: MTIUnaryImageRenderingFilter {
    var brightness: Float = 0
    
    
    override var parameters: [String : Any] {
        ["brightness": self.brightness]
    }
    
    
    override class func fragmentFunctionDescriptor() -> MTIFunctionDescriptor {
        let libraryURL = Bundle.main.url(forResource: "default", withExtension: "metallib")
        return MTIFunctionDescriptor(name: "brightnessAdjustment", libraryURL: libraryURL)
    }
}
