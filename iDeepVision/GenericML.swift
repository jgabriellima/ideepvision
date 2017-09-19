//
//  GenericML.swift
//  iDeepVision
//
//  Created by João Gabriel Rodrigues de Oliveira Lima on 17/09/17.
//  Copyright © 2017 João Gabriel Rodrigues de Oliveira Lima. All rights reserved.
//

import UIKit
import CoreMedia
import Vision

class GenericModel<T>{
    
    var squeezeNet:SqueezeNet!
    var inceptionv3Model:Inceptionv3!
    var mobileNet:MobileNet!
    var resnet50:Resnet50!
    var vGG16:VGG16!
    
    func prediction(model:String,image: CVPixelBuffer) throws -> AnyObject{
        
//        let inceptionv3Input = Inceptionv3Input(image: image)
//        let squeezeNetInput = SqueezeNetInput(image: image)
//        let mobileNetInput = MobileNetInput(image: image)
//        let resnet50Input = Resnet50Input(image: image)
//        let vGG16Input = VGG16Input(image: image)
        
        self.squeezeNet = SqueezeNet()
        return self.squeezeNet
//        switch model {
//        case "SqueezeNet":
//        default:
//            <#code#>
//        }
        
    }
    
}
