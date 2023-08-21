import ExpoModulesCore
import ARKit

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class ExpoArView: ExpoView {
  
    var sceneView: SCNView!
    var scene: SCNScene!
    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
        
        clipsToBounds = true
        sceneView = SCNView(frame: self.bounds)
        sceneView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(sceneView)
        setupScene()
    }
    
    func setupScene() {
       // Create a camera
       let camera = SCNCamera()

       // Set the camera's position
       let cameraNode = SCNNode()
       cameraNode.camera = camera
       cameraNode.position = SCNVector3(x: 0, y: 0, z: 1.5)
       
       
       let perspective = SCNCameraController()
       perspective.pointOfView = cameraNode
        // perspective.projectionTransform = SCNMatrix4MakePerspective(.pi/4, Float(UIScreen.main.bounds.width / UIScreen.main.bounds.height), 0.1, 100)

      
            
           let redMaterial = SCNMaterial()
          redMaterial.diffuse.contents = UIColor.red;
       
       
            let cubeGeometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0)
            let cubeNode = SCNNode(geometry: cubeGeometry)
       
             cubeNode.geometry?.materials = [redMaterial]
            cubeNode.position = SCNVector3(0.0, 0.0, -0.5)
         
       // rotation logic
       
       // Create an action to rotate the cube
       let rotateAction = SCNAction.rotate(by: .pi, around: SCNVector3(x: 1, y: 1, z: 1), duration: 2)

       // Create a repeating action to continuously rotate the cube
       let repeatAction = SCNAction.repeatForever(rotateAction)

       // Apply the repeating rotation action to the cube's node
       cubeNode.runAction(repeatAction)
            scene = SCNScene()
            scene.rootNode.addChildNode(cubeNode)
            sceneView.scene = scene
             // Add the camera to the scene's point of view
           sceneView.pointOfView = cameraNode

        }
}
