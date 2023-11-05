//
//  ModelPickerView.swift
//  ModelPickerApp
//
//  Created by Antonin Simon on 05/11/2023.
//

import SwiftUI

struct ModelPickerView: View {
    
    var models: [Model]
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0 ..< self.models.count, id: \.self) { index in
                    Button(action: {
                        print("DEBUG: Selected model with name : \(self.models[index].modelName)")
                        isPlacementEnabled = true
                        
                        selectedModel = self.models[index]
                        
                    }) {
                        Image(uiImage: self.models[index].image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .scrollClipDisabled()
        .padding(30)
        .background(Color.black.opacity(0.5))
    }
}

#Preview {
//    ModelPickerView()
    ContentView()
}
