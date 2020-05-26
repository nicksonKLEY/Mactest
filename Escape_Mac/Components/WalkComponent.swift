//
//  WalkComponent.swift
//  Escape_Mac
//
//  Created by Nickson Kley Gonçalves Da Silva on 16/05/20.
//  Copyright © 2020 Nickson Kley Gonçalves Da Silva. All rights reserved.
//

import GameplayKit

class WalkComponnet : GKComponent{

	let walkVelocity : Double
	let runVelocity : Double

	var xAxis : Double = 0.0
	var yAxis : Double = 0.0

	init(walk: Double, run: Double){

		self.walkVelocity = walk
		self.runVelocity = run

		super.init()

	}
	
	required init?(coder: NSCoder) {

		fatalError("init(coder:) has not been implemented")
		
	}

	override func update(deltaTime seconds: TimeInterval) {
		if( xAxis > 0.5 || yAxis > 0.5){
			walk(seconds: seconds)
		}
		else {
			run(seconds: seconds)
		}
	}

	func walk(seconds: TimeInterval){

		guard let entity = self.entity else { return }
		guard let body = entity.component(ofType: BodyComponent.self) else { return }

		body.node.position.x += CGFloat(seconds * walkVelocity * xAxis)
		body.node.position.y += CGFloat(seconds * walkVelocity * yAxis)

	}

	func run(seconds: TimeInterval){

		guard let entity = self.entity else { return }
		guard let body = entity.component(ofType: BodyComponent.self) else { return }

		body.node.position.x += CGFloat(seconds * walkVelocity * xAxis)
		body.node.position.y += CGFloat(seconds * walkVelocity * yAxis)

	}
	
}
