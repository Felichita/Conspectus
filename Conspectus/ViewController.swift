//
//  ViewController.swift
//  Conspectus
//
//  Created by Никита on 09.07.16.
//  Copyright © 2016 PinkElephants. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let disciplines = Disciplines()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		disciplines.load()
	}
	
}
