//
//  ARView.swift
//  MonkeyRading
//
//  Created by 정의찬 on 7/5/24.
//
import SwiftUI
import Vision
import ARKit
import AVFoundation

struct ContentView: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView(frame: .zero)
        arView.delegate = context.coordinator
        arView.session.run(ARWorldTrackingConfiguration())
        
        // Add text recognition
        let textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            if let results = request.results, !results.isEmpty {
                for result in results {
                    if let observation = result as? VNRecognizedTextObservation {
                        let topCandidate = observation.topCandidates(1).first
                        if let recognizedText = topCandidate?.string {
                            DispatchQueue.main.async {
                                context.coordinator.handleRecognizedText(recognizedText, arView: arView)
                            }
                        }
                    }
                }
            }
        }
        textRecognitionRequest.recognitionLevel = .accurate
        textRecognitionRequest.recognitionLanguages = ["en"]
        context.coordinator.textRecognitionRequest = textRecognitionRequest
        
        return arView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: ARViewContainer
        var textRecognitionRequest: VNRecognizeTextRequest?
        var player: AVAudioPlayer?
        let allowedAnimals = ["duck", "dog"]
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
            super.init()
        }
        
        func handleRecognizedText(_ text: String, arView: ARSCNView) {
            let animalName = text.lowercased()
            let words = animalName.split(separator: " ")
            let recognizedAnimals = words.filter { allowedAnimals.contains(String($0)) }
            
            for recognizedAnimal in recognizedAnimals {
                displayAnimal(String(recognizedAnimal), in: arView)
            }
        }
        
        func displayAnimal(_ animalName: String, in arView: ARSCNView) {
            if let usdzURL = Bundle.main.url(forResource: animalName, withExtension: "usdz") {
                let scene = try! SCNScene(url: usdzURL, options: nil)
                let node = SCNNode()
                for childNode in scene.rootNode.childNodes {
                    node.addChildNode(childNode)
                }
                node.scale = SCNVector3(0.05, 0.05, 0.05)
                node.position = SCNVector3(0, 0, -1)
                
                arView.scene.rootNode.addChildNode(node)
                
                if let soundURL = Bundle.main.url(forResource: animalName, withExtension: "mp3") {
                    do {
                        player = try AVAudioPlayer(contentsOf: soundURL)
                        player?.play()
                    } catch {
                        print("Failed to play sound: \(error.localizedDescription)")
                    }
                } else {
                    print("Sound file not found for animal: \(animalName)")
                }
            } else {
                print("USDZ file not found for animal: \(animalName)")
            }
        }

        // ARSCNViewDelegate methods
        func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
            guard let arView = renderer as? ARSCNView,
                  let currentFrame = arView.session.currentFrame else { return }
            
            let requestHandler = VNImageRequestHandler(cvPixelBuffer: currentFrame.capturedImage, options: [:])
            try? requestHandler.perform([textRecognitionRequest].compactMap { $0 })
        }
    }
}
