import UIKit
import SpriteKit

class GameViewController: UIViewController {
    let scene = GameScene()

    override func viewDidLoad() {
        super.viewDidLoad()
        scene.size = .init(width: view.bounds.width, height: view.bounds.height)
        scene.backgroundColor = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
        
        let skView = SKView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width))
        view.addSubview(skView)
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
