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
        scene = SCNScene()
        sceneView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(sceneView)
        setupScene()
    }
    
    
    func loadObjModel(url: URL) -> SCNNode? {
            guard let objScene = try? SCNScene(url: url, options: nil) else {
                print("Error loading .obj file.")
                return nil
            }

            let objNode = SCNNode()
            for childNode in objScene.rootNode.childNodes {
                
                let texture = UIImage(named: "texture.png")
                let texture2 = UIImage(named: "texture2.png")
                let texture3 = UIImage(named: "texture3.png")
                let texture4 = UIImage(named: "texture4.png")
                
                let material = SCNMaterial()
                material.diffuse.contents = texture
                
                let material2 = SCNMaterial()
                material2.diffuse.contents = texture2
                
                let material3 = SCNMaterial()
                material3.diffuse.contents = texture3
                
                let material4 = SCNMaterial()
                material4.diffuse.contents = texture4
                
                childNode.geometry?.materials = [material, material3, material2, material4]
             objNode.addChildNode(childNode)
            }

            return objNode
        }
    
    func setupScene() {
       // Create a camera
       let camera = SCNCamera()

       // Set the camera's position
       let cameraNode = SCNNode()
       cameraNode.camera = camera
       cameraNode.position = SCNVector3(x: 0, y: 0, z: 20)
       
        
       
       let perspective = SCNCameraController()
       perspective.pointOfView = cameraNode
        // perspective.projectionTransform = SCNMatrix4MakePerspective(.pi/4, Float(UIScreen.main.bounds.width / UIScreen.main.bounds.height), 0.1, 100)

       
      
        if let objURL = Bundle.main.url(forResource: "Pikachu", withExtension: "obj"),
            let objNode = loadObjModel(url: objURL) {
            scene.rootNode.addChildNode(objNode)
            
            let rotateAction = SCNAction.rotate(by: .pi, around: SCNVector3(x: 0, y: 1, z: 0), duration: 2)
            
            let repeatAction = SCNAction.repeatForever(rotateAction)
            
            objNode.runAction(repeatAction)
        }
        
        
        
       
         
        
       
        sceneView.scene = scene
         // Add the camera to the scene's point of view
       sceneView.pointOfView = cameraNode
         
    }
}
