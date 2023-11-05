//
//  Model.swift
//  ModelPickerApp
//
//  Created by Antonin Simon on 05/11/2023.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        let fileName = modelName + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: { loadCompletion in
                // Handle our error
                print("DEBUG: Unable to load modelEntity for modelName: \(self.modelName)")
            }, receiveValue: { modelEntity in
                // Get our model entity
                self.modelEntity = modelEntity
                print("DEBUG: Succesfully loaded modelEntity for modelName: \(self.modelName)")
            })
    }
}
