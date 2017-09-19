//
//  ViewController.swift
//  iDeepVision
//
//  Created by João Gabriel Rodrigues de Oliveira Lima on 17/09/17.
//  Copyright © 2017 João Gabriel Rodrigues de Oliveira Lima. All rights reserved.

import UIKit
import CoreMedia
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate  {

    @IBOutlet weak var predictLabel: UILabel!
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var segmentedModels: UISegmentedControl!
    private var alert:UIAlertController!
    private var videoCapture: VideoCapture!
    private var requests = [VNRequest]()
    
    private var squeezeNet = SqueezeNet()
    private var inceptionv3 = Inceptionv3()
    private var mobileNet = MobileNet()
    private var resnet50 = Resnet50()
    private var vGG16 = VGG16()
    
    
    private var SIZE=299
    private var indexModel = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoCapture = VideoCapture(cameraType: .back,
                                    preferredSpec: VideoSpec(fps: 5, size: CGSize(width: SIZE, height: SIZE)),
                                    previewContainer: previewView.layer)
        videoCapture.imageBufferHandler = {[unowned self] (imageBuffer) in
            self.handleImageBufferWithCoreML(imageBuffer: imageBuffer)
        }
        
        self.changeModel()
    }
    
    func changeModel(){
        
        self.indexModel = segmentedModels.selectedSegmentIndex
        
        switch self.indexModel {
        case 0:
            self.SIZE = 299
            break
        case 1:
            self.SIZE = 224
            break
        case 2:
            self.SIZE = 224
            break
        case 3:
            self.SIZE = 224
            break
        case 4:
            self.SIZE = 227
            break
        default:
            self.SIZE = 299
        }

    }
   
    func handleImageBufferWithCoreML(imageBuffer: CMSampleBuffer) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(imageBuffer) else {
            return
        }
        do {
            switch self.indexModel {
            case 0:
                let prediction = try self.inceptionv3.prediction(image: self.resize(pixelBuffer: pixelBuffer)!)
                DispatchQueue.main.async {
                    if let prob = prediction.classLabelProbs[prediction.classLabel] {
                        self.predictLabel.text = "\(prediction.classLabel) \(String(describing: prob))"
                    }
                }
                break
            case 1:
                let prediction = try self.mobileNet.prediction(image: self.resize(pixelBuffer: pixelBuffer)!)
                DispatchQueue.main.async {
                    if let prob = prediction.classLabelProbs[prediction.classLabel] {
                        self.predictLabel.text = "\(prediction.classLabel) \(String(describing: prob))"
                    }
                }
                break
            case 2:
                let prediction = try self.resnet50.prediction(image: self.resize(pixelBuffer: pixelBuffer)!)
                DispatchQueue.main.async {
                    if let prob = prediction.classLabelProbs[prediction.classLabel] {
                        self.predictLabel.text = "\(prediction.classLabel) \(String(describing: prob))"
                    }
                }
                break
            case 3:
                let prediction = try self.vGG16.prediction(image: self.resize(pixelBuffer: pixelBuffer)!)
                DispatchQueue.main.async {
                    if let prob = prediction.classLabelProbs[prediction.classLabel] {
                        self.predictLabel.text = "\(prediction.classLabel) \(String(describing: prob))"
                    }
                }
                break
            case 4:
                let prediction = try self.squeezeNet.prediction(image: self.resize(pixelBuffer: pixelBuffer)!)
                DispatchQueue.main.async {
                    if let prob = prediction.classLabelProbs[prediction.classLabel] {
                        self.predictLabel.text = "\(prediction.classLabel) \(String(describing: prob))"
                    }
                }
                break
            default:
                let prediction = try self.inceptionv3.prediction(image: self.resize(pixelBuffer: pixelBuffer)!)
                DispatchQueue.main.async {
                    if let prob = prediction.classLabelProbs[prediction.classLabel] {
                        self.predictLabel.text = "\(prediction.classLabel) \(String(describing: prob))"
                    }
                }
            }
           
        }
        catch let error as NSError {
            print(error)
            fatalError("Unexpected error ocurred: \(error.debugDescription).")
        }
    }
    
    @IBAction func segmentedModels(_ sender: UISegmentedControl) {
        self.changeModel()
    }

    func resize(pixelBuffer: CVPixelBuffer) -> CVPixelBuffer? {
        let imageSide = SIZE
        var ciImage = CIImage(cvPixelBuffer: pixelBuffer, options: nil)
        let transform = CGAffineTransform(scaleX: CGFloat(imageSide) / CGFloat(CVPixelBufferGetWidth(pixelBuffer)), y: CGFloat(imageSide) / CGFloat(CVPixelBufferGetHeight(pixelBuffer)))
        ciImage = ciImage.transformed(by: transform).cropped(to: CGRect(x: 0, y: 0, width: imageSide, height: imageSide))
        let ciContext = CIContext()
        var resizeBuffer: CVPixelBuffer?
        CVPixelBufferCreate(kCFAllocatorDefault, imageSide, imageSide, CVPixelBufferGetPixelFormatType(pixelBuffer), nil, &resizeBuffer)
        ciContext.render(ciImage, to: resizeBuffer!)
        return resizeBuffer
    }

    @IBAction func about(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sobre", message: "Espero que você tenha gostado desse projeto! \nQuer conhecer mais sobre Deep Neural models? Vamos conversar! ;) \n\n João Gabriel Lima", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Linkedin", style: UIAlertActionStyle.default, handler: { action in
            if let url = URL(string: "https://www.linkedin.com/in/joaogabriellima/"){
                UIApplication.shared.open(url,options:[:])
            }
        }))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let videoCapture = videoCapture else {return}
        videoCapture.startCapture()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let videoCapture = videoCapture else {return}
        videoCapture.resizePreview()
    }

    override func viewWillDisappear(_ animated: Bool) {
        guard let videoCapture = videoCapture else {return}
        videoCapture.stopCapture()
        navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

