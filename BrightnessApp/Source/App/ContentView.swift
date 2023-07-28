//
//  ContentView.swift
//  BrightnessApp
//
//  Created by Ромка Бережной on 27.07.2023.
//

import SwiftUI


struct ContentView: View {
    private let imageEditorVM: ImageEditorViewModel? = .init()
    
    
    var body: some View {
        if let imageEditorVM = self.imageEditorVM {
            ImageEditorView(vm: imageEditorVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
