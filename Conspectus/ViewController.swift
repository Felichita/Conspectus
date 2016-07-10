//
//  ViewController.swift
//  Conspectus
//
//  Created by Никита on 09.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoaderViewDelegate {

	var loaderView = LoaderView(frame: CGRectZero)
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		self.addLoader()
	}
	
	func addLoader() {
		let boxSize: CGFloat = 100.0
		loaderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
		                          y: view.bounds.height / 2 - boxSize / 2,
		                          width: boxSize,
		                          height: boxSize)
		loaderView.parentFrame = view.frame
		loaderView.delegate = self
		view.addSubview(loaderView)
		loaderView.addOval()
	}
	
	func loaderFinished() {
		loaderView.removeFromSuperview()
		self.showMainScreen()
	}
	
	func showMainScreen() {
		let targetStoryboard = UIStoryboard(name: "NotesBoard", bundle: nil)
		if let targetViewController = targetStoryboard.instantiateInitialViewController() {
			self.navigationController?.pushViewController(targetViewController, animated: true)
		}
	}
	
}