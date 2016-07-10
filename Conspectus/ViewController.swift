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
	
    @IBAction func goDraw(sender: UIButton) {
		let targetStoryboard = UIStoryboard(name: "Canvas", bundle: nil)
		if let targetViewController = targetStoryboard.instantiateInitialViewController() {
			self.navigationController?.pushViewController(targetViewController, animated: true)
		}
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		disciplines.load()
	}
	
}
