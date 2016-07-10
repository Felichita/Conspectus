//
//  CanvasView.swift
//  Conspectus
//
//  Created by Федор Николаев on 09.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import UIKit

let bound = 70
let π = CGFloat(M_PI)

func getDocumentsURL() -> NSURL {
	let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
	return documentsURL
}

func fileInDocumentsDirectory(filename: String) -> String {
	
	let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
	print(fileURL)
	return fileURL.path!
	
}

func saveImage(image: UIImage, path: String) -> Bool{
	let pngImageData = UIImagePNGRepresentation(image)
	let result = pngImageData!.writeToFile(path,atomically: true)
	
	return result
}

class CanvasView: UIImageView {
	
	var count = 0
	// Parameters
	private let defaultLineWidth:CGFloat = 3
	
	private var drawColor: UIColor = UIColor.darkGrayColor()
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		guard let touch = touches.first else { return }
		UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
		let context = UIGraphicsGetCurrentContext()
		
		// Draw previous image into context
		image?.drawInRect(bounds)
		
		drawStroke(context, touch: touch)

		// Update image
		image = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
	}
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
		let imagePath = fileInDocumentsDirectory("\(count)discip.jpg")
		
		if let image = self.image{
			
			saveImage(image, path: imagePath)
			count += 1
			("save png, touches ended")
		}else{
			
			print("some error message")
		}
	}
	private func drawStroke(context: CGContext?, touch: UITouch) {
		let previousLocation = touch.previousLocationInView(self)
		let location = touch.locationInView(self)
		
		// Calculate line width for drawing stroke
		let lineWidth = lineWidthForDrawing(context, touch: touch)
		
		// Set color
		drawColor.setStroke()
		
		// Configure line
		CGContextSetLineWidth(context, lineWidth)
		CGContextSetLineCap(context, .Round)
		
		
		// Set up the points
		CGContextMoveToPoint(context, previousLocation.x, previousLocation.y)
		CGContextAddLineToPoint(context, location.x, location.y)
		// Draw the stroke
		CGContextStrokePath(context)
		
	}
	
	private func lineWidthForDrawing(context: CGContext?, touch: UITouch) -> CGFloat {
		
		let lineWidth = defaultLineWidth
		
		return lineWidth
	}
	
	func clearCanvas(animated animated: Bool) {
		if animated {
			UIView.animateWithDuration(0.5, animations: {
				self.alpha = 0
				}, completion: { finished in
					self.alpha = 1
					self.image = nil
			})
		} else {
			image = nil
		}
	}
}
