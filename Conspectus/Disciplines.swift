//
//  Discipline.swift
//  Conspectus
//
//  Created by Никита on 09.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import Foundation

struct Discipline {
	var name: String
}

class Disciplines {

	var list = [Discipline]()
	
	func add(name: String) -> Void {
		let discipline = Discipline(name: name)
		self.list.append(discipline)
	}
	
	func remove(row: Int) -> Void {
		self.list.removeAtIndex(row)
	}
	
	func load() -> Void {
		// some initial code
		let disciplines = ["Матан", "Химия", "Языки и методы", "Дифференциальные уравнения", "Теория вероятности", "Английский язык"]
		for k in disciplines {
			let discipline = Discipline(name: k)
			self.list.append(discipline)
		}
	}
	
}