//
//  GameScene.swift
//  Escape_Mac
//
//  Created by Nickson Kley Gonçalves Da Silva on 16/05/20.
//  Copyright © 2020 Nickson Kley Gonçalves Da Silva. All rights reserved.
//

import SpriteKit
import GameplayKit
import IOKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0

    }

	override func didMove(to view: SKView) {

		super.didMove(to: view)

		entities.append(PlayerEntity(scene: self))
		self.isUserInteractionEnabled = true
		
	}

	override func keyDown(with event: NSEvent) {

		for entity in self.entities{

			guard let keyboardControler = entity.component(ofType: KeyboardControlerComponent.self) else { return }

			keyboardControler.node.keyDown(with: event)

		}

	}

	override func keyUp(with event: NSEvent) {

		for entity in self.entities{
			guard let keyboardControler = entity.component(ofType: KeyboardControlerComponent.self) else { return }

			keyboardControler.node.keyUp(with: event)

		}

	}
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }

}
