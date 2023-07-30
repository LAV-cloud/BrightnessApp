//
//  ImageEditorViewModel.swift
//  BrightnessApp
//
//  Created by Ромка Бережной on 27.07.2023.
//

import UIKit
import SwiftUI
import MetalPetal
import Foundation


final class ImageEditorViewModel: ObservableObject {
    @Published private (set) var image: UIImage
    @Published var intensivity: Float = 0.0
    var isEditing: Bool = false
    @Published private (set) var isLoading: Bool = false
    private let originalImage: UIImage
    
    
    private let service: ImageProccessingService
    
    
    init?(imageName: String, service: ImageProccessingService) {
        guard let image = UIImage(named: imageName) else {
            return nil
        }
        
        self.service = service
        self.originalImage = image
        self.image = image
    }
    
    
    func setBrightnessFilter() {
        self.setLoading(true)
        
        let brightness = self.intensivity
        let image: UIImage = self.originalImage
        Task.detached(priority: .userInitiated) {
            guard let resultImage = self.service.proccess(image: image, intensivity: brightness) else {
                DispatchQueue.main.async {
                    self.setLoading(false)
                }
                return
            }
            
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.image = resultImage
                    self.setLoading(false)                    
                }
            }
        }
    }
    
    
    private func setLoading(_ loading: Bool) {
        withAnimation(.easeInOut(duration: 0.2)) {
            self.isLoading = loading
        }
    }
}
