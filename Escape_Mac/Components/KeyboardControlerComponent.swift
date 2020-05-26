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

			self.isUserInteractionEnabled = true
			self.zPosition = 10

		}
		
		required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
		
		var xAxis = 0.0
		var yAxis = 0.0

		override func keyUp(with event: NSEvent) {

			switch event.keyCode {
				case 13:
				//UP
					if(event.modifierFlags.contains(.shift)){

						self.xAxis -= 1

					}
					else{

						self.xAxis -= 0.5

					}
				case 1:
				//DOWN
					if(event.modifierFlags.contains(.shift)){

						self.xAxis -= -1

					}
					else{

						self.xAxis -= -0.5

					}
				case 0:
				//LEFT
					if(event.modifierFlags.contains(.shift)){

						self.yAxis -= -1

					}
					else{

						self.yAxis -= -0.5

					}
				case 2:
				//RIGTH
					if(event.modifierFlags.contains(.shift)){

						self.yAxis -= 1

					}
					else{

						self.yAxis -= 0.5

					}
				default:
				break
			}

		}

		override func keyDown(with event: NSEvent) {

			print("apertou")


			switch event.keyCode {
				case 13:
				//UP
					self.xAxis += 0.5
				case 1:
				//DOWN
					self.xAxis += -0.5
				case 0:
				//LEFT
					self.yAxis += -0.5
				case 2:
				//RIGTH
					self.yAxis += 0.5
				default:
				break
			}


			if(event.modifierFlags.contains(.shift)){
				xAxis *= 2
				yAxis *= 2
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


	}

}
