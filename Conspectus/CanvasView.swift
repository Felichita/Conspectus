//
//  CanvasView.swift
//  Conspectus
//
//  Created by Федор Николаев on 09.07.16.
//  Copyright © 2016 Pink Elephants. All rights reserved.
//

import Foundation
import UIKit

let π = CGFloat(M_PI)

class CanvasView: UIImageView {
    
    // Parameters
    private let defaultLineWidth:CGFloat = 6
    
    private var drawColor: UIColor = UIColor.redColor()
    
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