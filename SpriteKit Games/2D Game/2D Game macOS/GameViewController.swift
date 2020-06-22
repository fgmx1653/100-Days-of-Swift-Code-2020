//
//  GameViewController.swift
//  2D Game macOS
//
//  Created by Caleb Wells on 4/24/20.
//  Copyright © 2020 Caleb Wells. All rights reserved.
//

import Cocoa
import SpriteKit

class GameViewController: NSViewController {
    let scene = GameScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene.size = .init(width: view.bounds.width, height: view.bounds.height)
        scene.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
        
        let skView = SKView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
//        skView.backgroundColor = UIColor.black
        view.addSubview(skView)
        
        skView.presentScene(scene)
    }
}
