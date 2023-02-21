//
//  ViewController.swift
//  SolarSystemArKit
//
//  Created by Burak Afyonlu on 22.02.2023.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
       
     // let myBox =  SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        

        //let mySphere = createSphere(radius: 0.1, content: "stone.png", vector: SCNVector3(0, 0.2, -1))
        
        let myWorld1 = createSphere(radius: 0.1, content: "gezegen1.jpeg", vector: SCNVector3(0, 0.2, -1))
        let myWorld2 = createSphere(radius: 0.2, content: "gezegen2.jpeg", vector: SCNVector3(0.5, 0.2, -1))
        let myWorld3 = createSphere(radius: 0.3, content: "gezegen3.jpeg", vector: SCNVector3(1.5, 0.2, -1))
        let myWorld4 = createSphere(radius: 0.15, content: "Volcanic.png", vector: SCNVector3(2.5, 0.2, -1))
        
        
        sceneView.scene.rootNode.addChildNode(myWorld1)
        sceneView.scene.rootNode.addChildNode(myWorld2)
        sceneView.scene.rootNode.addChildNode(myWorld3)
        sceneView.scene.rootNode.addChildNode(myWorld4)
        
        sceneView.automaticallyUpdatesLighting = true
    }
    
    func createSphere(radius: CGFloat, content: String , vector: SCNVector3) -> SCNNode {
        
        let mySphere = SCNSphere(radius: radius)
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        
        mySphere.materials = [boxMaterial]
        
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphere
        
        return node
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
