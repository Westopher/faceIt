//
//  FaceView.swift
//  FaceIt
//
//  Created by West Kraemer on 7/27/17.
//  Copyright © 2017 West Kraemer. All rights reserved.
//

import UIKit

class FaceView: UIView {

    var scale: CGFloat = 0.9
    
    private var skullRadius: CGFloat {
     return min(bounds.size.width, bounds.size.height) / 2
    }
    
    private var skullCenter: CGPoint {
    return CGPoint(x: bounds.midX, y: bounds.midY)
    }

    private enum Eye {
        case left
        case right
    }
    
    private func pathForEye(_ eye: Eye) -> UIBezierPath {
        
        
        
    }
    
    private func pathForSkull() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = 5.0
        return path
    }

    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = 5.0
        UIColor.blue.set()
        pathForSkull().stroke()
        
    }

}
