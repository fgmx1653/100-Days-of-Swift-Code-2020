import SpriteKit

class GameScene: SKScene {
    var playerOne = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        playerOne = SKSpriteNode(imageNamed: "Idle 01")
        playerOne.setScale(0.5)
        playerOne.position = CGPoint(x: 200, y: 300)
        addChild(playerOne)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if playerOne.position == CGPoint(x: 200, y: 300) {
            playerOne.position = CGPoint(x: 300, y: 300)
        } else {
            playerOne.position = CGPoint(x: 200, y: 300)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        //
    }
}

