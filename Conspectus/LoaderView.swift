//
//  HolderView.swift
//  Conspectus
//
//  Created by Федор Николаев on 10.07.16.
//  Copyright © 2016 Fedor Nikolaev. All rights reserved.
//

import UIKit

protocol LoaderViewDelegate: class {
	func addLoader()
	func loaderFinished()
}

class LoaderView: UIView {
	
	let ovalLayer = OvalLayer()
	let triangleLayer = TriangleLayer()
	let redRectangleLayer = RectangleLayer()
	let blueRectangleLayer = RectangleLayer()
	let arcLayer = ArcLayer()
	
	var parentFrame: CGRect = CGRectZero
	weak var delegate: LoaderViewDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.clearColor()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	func addOval() {
		layer.addSublayer(ovalLayer)
		ovalLayer.expand()
		NSTimer.scheduledTimerWithTimeInterval(0.3, target: self,
		                                       selector: #selector(LoaderView.wobbleOval),
		                                       userInfo: nil, repeats: false)
	}
	
	func wobbleOval() {
		ovalLayer.wobble()

		layer.addSublayer(triangleLayer)
		ovalLayer.wobble()

		NSTimer.scheduledTimerWithTimeInterval(0.6, target: self,
		                                       selector: #selector(LoaderView.drawAnimatedTriangle),
		                                       userInfo: nil, repeats: false)
	}
	
	func drawAnimatedTriangle() {
		triangleLayer.animate()
		NSTimer.scheduledTimerWithTimeInterval(0.7, target: self,
		                                       selector: #selector(LoaderView.spinAndTransform),
		                                       userInfo: nil, repeats: false)
	}
	
	func spinAndTransform() {

		layer.anchorPoint = CGPointMake(0.5, 0.6)

		let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
		rotationAnimation.toValue = CGFloat(M_PI * 2.0)
		rotationAnimation.duration = 0.45
		rotationAnimation.removedOnCompletion = true
		layer.addAnimation(rotationAnimation, forKey: nil)

		ovalLayer.contract()
		
		NSTimer.scheduledTimerWithTimeInterval(0.25, target: self,
		                                       selector: #selector(LoaderView.drawRedAnimatedRectangle),
		                                       userInfo: nil, repeats: false)
		NSTimer.scheduledTimerWithTimeInterval(0.45, target: self,
		                                       selector: #selector(LoaderView.drawBlueAnimatedRectangle),
		                                       userInfo: nil, repeats: false)
	}
	
	func drawRedAnimatedRectangle() {
		layer.addSublayer(redRectangleLayer)
		redRectangleLayer.animateStrokeWithColor(UIColor.redColor())
	}
	
	func drawBlueAnimatedRectangle() {
		layer.addSublayer(blueRectangleLayer)
		blueRectangleLayer.animateStrokeWithColor(UIColor.blueColor())
		NSTimer.scheduledTimerWithTimeInterval(0.30, target: self,
		                                       selector: #selector(LoaderView.drawArc),
		                                       userInfo: nil, repeats: false)
	}
	
	func drawArc() {
		layer.addSublayer(arcLayer)
		arcLayer.animate()
		NSTimer.scheduledTimerWithTimeInterval(0.80, target: self,
		                                       selector: #selector(LoaderView.expandView),
		                                       userInfo: nil, repeats: false)
	}
	
	func expandView() {
		self.delegate?.loaderFinished()
	}
	
}


