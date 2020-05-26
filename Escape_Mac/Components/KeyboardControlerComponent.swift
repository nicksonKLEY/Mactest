//
//  ControlleComponent.swift
//  Escape_Mac
//
//  Created by Nickson Kley Gonçalves Da Silva on 16/05/20.
//  Copyright © 2020 Nickson Kley Gonçalves Da Silva. All rights reserved.
//

import GameplayKit

class KeyboardControlerComponent : GKSKNodeComponent{

	class Keyboard : SKNode{

		override init() {

			super.init()

		}
		
		required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
		
		var xAxis = 0.0
		var yAxis = 0.0
		var sprint = false
		var keysPressed : Set = Set<UInt16>()

		override func keyUp(with event: NSEvent) {

			self.keysPressed.remove(event.keyCode)

			xAxis = 0
			yAxis = 0

			self.keysPressed.forEach { (keyCode) in
				if keyCode == 13{

					yAxis = 0.5

				}
				else if keyCode == 1{

					yAxis = -0.5

				}
				else if keyCode == 0{

					xAxis = -0.5

				}
				else if keyCode == 2{

					xAxis = 0.5

				}
			}

		}

		override func keyDown(with event: NSEvent) {

			self.keysPressed.insert(event.keyCode)

			switch event.keyCode {
				case 13:
				//UP
					self.yAxis = 0.5
				case 1:
				//DOWN
					self.yAxis = -0.5
				case 0:
				//LEFT
					self.xAxis = -0.5
				case 2:
				//RIGTH
					self.xAxis = 0.5
				default:
					print(event.keyCode)
					break
			}

			if(event.modifierFlags.contains(.shift)){
				self.sprint = true
			}
			else{
				self.sprint = false
			}

		}

	}

	override func didAddToEntity() {

		self.node = Keyboard()

		guard let entity = self.entity else { return}
		guard let body = entity.component(ofType: BodyComponent.self) else { return }


		body.node.addChild(self.node)


	}

	override func update(deltaTime seconds: TimeInterval) {

		guard let entity = self.entity else {

			return

		}
		guard let walkComponent = entity.component(ofType: WalkComponnet.self) else {

			return

		}
		guard let keyboard = self.node as? Keyboard else {

			return

		}

		walkComponent.xAxis = keyboard.xAxis
		walkComponent.yAxis = keyboard.yAxis
		walkComponent.sprint = keyboard.sprint


	}

}
