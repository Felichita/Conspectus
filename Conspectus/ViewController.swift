//
//  ViewController.swift
//  Conspectus
//
//  Created by Никита on 09.07.16.
//  Copyright © 2016 PinkElephants. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var holderView = HolderView(frame: CGRectZero)
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		addHolderView()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func addHolderView() {
		let boxSize: CGFloat = 100.0
		holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
		                          y: view.bounds.height / 2 - boxSize / 2,
		                          width: boxSize,
		                          height: boxSize)
		holderView.parentFrame = view.frame
		holderView.delegate = self.holderView.delegate
		view.addSubview(holderView)
		holderView.addOval()
	}
	
	func animateLabel() {
		// 1
		holderView.removeFromSuperview()
		view.backgroundColor = UIColor.blueColor()
		
		// 2
		let label: UILabel = UILabel(frame: view.frame)
		label.textColor = UIColor.whiteColor()
		label.font = UIFont(name: "HelveticaNeue-Thin", size: 170.0)
		label.textAlignment = NSTextAlignment.Center
		label.text = "S"
		label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
		view.addSubview(label)
		
		// 3
		UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut,
		                           animations: ({
									label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0)
								}), completion: { finished in
									self.targetBoard("notesBoard")
		})
	}
	
	func targetBoard(name:String){
		let targetStoryboard = UIStoryboard(name: name, bundle: nil)
		if let targetViewController = targetStoryboard.instantiateInitialViewController() {
			self.navigationController?.pushViewController(targetViewController, animated: true)
		}
	}
	
	
	func buttonPressed(sender: UIButton!) {
		view.backgroundColor = UIColor.whiteColor()
		// view.subviews.map({ $0.removeFromSuperview() })
		holderView = HolderView(frame: CGRectZero)
		addHolderView()
	}
}