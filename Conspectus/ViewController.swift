//
//  ViewController.swift
//  Conspectus
//
//  Created by Никита on 09.07.16.
//  Copyright © 2016 PinkElephants. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	
    @IBAction func goDraw(sender: UIButton) {
		let targetStoryboard = UIStoryboard(name: "Canvas", bundle: nil)
		print(self.navigationController)
		if let targetViewController = targetStoryboard.instantiateInitialViewController() {
			self.navigationController?.pushViewController(targetViewController, animated: true)
		}
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
}
