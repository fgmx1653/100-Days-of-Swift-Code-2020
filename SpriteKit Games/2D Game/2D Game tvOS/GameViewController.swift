//  GameViewController.swift
//  2D Game tvOS

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    let scene = GameScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene.size = .init(width: view.bounds.width, height: view.bounds.height)
        scene.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
        
        let skView = SKView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        skView.backgroundColor = UIColor.black
        view.addSubview(skView)
        
        skView.presentScene(scene)
    }
}
