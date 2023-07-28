//
//  ImageEditorView.swift
//  BrightnessApp
//
//  Created by Ромка Бережной on 27.07.2023.
//

import SwiftUI


struct ImageEditorView: View {
    @StateObject var vm: ImageEditorViewModel
    
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                Image(uiImage: self.vm.image)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                    .scaledToFill()
                
                Slider(value: self.$vm.intensivity, in: -1...1, step: 0.01) { isEditing in
                    if self.vm.isEditing && !isEditing {
                        self.vm.setBrightnessFilter()
                    }
                    self.vm.isEditing = isEditing
                }
                .padding(.horizontal, 32)
                .frame(maxWidth: proxy.size.width, alignment: .center)
                
                VStack {
                    if self.vm.isLoading {
                        ZStack {
                            Color.black.opacity(0.2)
                            
                            ProgressView()
                        }
                    }                    
                }
            }
            .frame(maxWidth: proxy.size.width, minHeight: proxy.size.height, alignment: .bottom)
        }
    }
}
