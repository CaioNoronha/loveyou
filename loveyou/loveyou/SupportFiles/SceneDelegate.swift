import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionsOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            let loveView = LoveViewController()
            window.rootViewController = UINavigationController(rootViewController: loveView)
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
