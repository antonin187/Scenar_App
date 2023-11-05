//
//  PlacementButtonView.swift
//  ModelPickerApp
//
//  Created by Antonin Simon on 05/11/2023.
//

import SwiftUI

struct PlacementButtonView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    
    var body: some View {
        HStack {
            // Cancel Button
            Button(action: {
                print("DEBUG: Cancel model placement.")
                
                resetPlacementParameters()
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(20)
            })
            
            // Confirm Button
            Button(action: {
                print("DEBUG: Confirm model placement.")
                
                modelConfirmedForPlacement = self.selectedModel
                
                resetPlacementParameters()
            }, label: {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(20)
            })
        }
    }
    func resetPlacementParameters() {
        isPlacementEnabled = false
        selectedModel = nil
    }
}

#Preview {
//    PlacementButtonView()
    ContentView()
    
}
