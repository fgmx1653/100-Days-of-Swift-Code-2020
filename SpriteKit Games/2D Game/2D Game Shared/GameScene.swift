//  GameScene.swift

import SpriteKit
import GameController

class GameScene: SKScene {
    var playerOne = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        playerOne = SKSpriteNode(imageNamed: "Walk 01")
        playerOne.position = CGPoint(x: 200, y: 200)
        addChild(playerOne)
        
        gameControllersObserver()
    }
    
    #if os(iOS) || os(tvOS)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if playerOne.position == CGPoint(x: 200, y: 200) {
            playerOne.position = CGPoint(x: 540, y: 200)
        } else {
            playerOne.position = CGPoint(x: 200, y: 200)
        }
        
    }
    #endif
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    //MARK: - Game Controllers
    func gameControllersObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(connectControllers), name: NSNotification.Name.GCControllerDidConnect, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(disconnectControllers), name: NSNotification.Name.GCControllerDidDisconnect, object: nil)
    }
    
    @objc func connectControllers() {
        var indexNumber = 0
        for controller in GCController.controllers() {
            if controller.extendedGamepad != nil {
                controller.playerIndex = GCControllerPlayerIndex.init(rawValue: indexNumber)!
                indexNumber += 1
                setupControllerControls(controller: controller)
            }
        }
    }
    
    @objc func disconnectControllers() {
        // do stuff
    }
    
    func setupControllerControls(controller: GCController) {
        controller.extendedGamepad?.valueChangedHandler = {
            (gamepad: GCExtendedGamepad, element: GCControllerElement) in
            self.gameControllerGamepad(gamepad: gamepad)
        }
    }
    
    func gameControllerGamepad(gamepad: GCExtendedGamepad) {
        let moveLeft = SKAction.moveBy(x: -100, y: 0, duration: 5)
        let moveRight = SKAction.moveBy(x: 100, y: 0, duration: 5)
        let jump = SKAction.moveBy(x: 0, y: -300, duration: 0.5)
        let fall = SKAction.moveBy(x: 0, y: 300, duration: 0.2)
        
        
        if gamepad.leftThumbstick.left.isPressed {
            playerOne.run(moveLeft)
        }
        
        if gamepad.leftThumbstick.right.isPressed {
            playerOne.run(moveRight)
        }
        
        if gamepad.buttonA.isPressed {
            playerOne.run(jump)
            playerOne.run(fall)
        }
        
        if gamepad.dpad.left.isPressed {
            playerOne.run(moveLeft)
        }
        
        if gamepad.dpad.right.isPressed {
            playerOne.run(moveRight)
        }
    }
    
    func gameControllerMicroGamepad(gamepad: GCMicroGamepad) {
        let moveRight = SKAction.fadeAlpha(by: 0, duration: 2)
        
        if gamepad.buttonMenu.isPressed {
            playerOne.run(moveRight)
        }
    }
    
    #if os(OSX)

    #endif
}
