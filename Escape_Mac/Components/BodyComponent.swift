//
//  BodyComponent.swift
//  Escape_Mac
//
//  Created by Nickson Kley Gonçalves Da Silva on 16/05/20.
//  Copyright © 2020 Nickson Kley Gonçalves Da Silva. All rights reserved.
//

import GameplayKit

class BodyComponent : GKSKNodeComponent{

	let size : CGSize

	init(scene: SKNode,size: CGSize){

		self.size = size

		super.init()

		self.node.isUserInteractionEnabled = true
		self.node = SKSpriteNode(texture: nil, color: .gray, size: self.size)

		scene.addChild(self.node)

	}

	required init?(coder: NSCoder) {

		fatalError("init(coder:) has not been implemented")
		
	}

}
