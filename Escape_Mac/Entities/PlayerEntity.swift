//
//  PlayerEntity.swift
//  Escape_Mac
//
//  Created by Nickson Kley Gonçalves Da Silva on 16/05/20.
//  Copyright © 2020 Nickson Kley Gonçalves Da Silva. All rights reserved.
//

import GameplayKit

class PlayerEntity : GKEntity{

	init(scene: SKNode) {

		super.init()

		self.addComponent(BodyComponent(scene: scene, size: CGSize(width: 100, height: 100)))
		self.addComponent(WalkComponnet(walk: 50, run: 80))
		self.addComponent(KeyboardControlerComponent())

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
