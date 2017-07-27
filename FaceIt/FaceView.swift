//
//  FaceView.swift
//  FaceIt
//
//  Created by West Kraemer on 7/27/17.
//  Copyright © 2017 West Kraemer. All rights reserved.
//

import UIKit

class FaceView: UIView {

    var scale: CGFloat = 0.8
    
    var eyesOpen: Bool = true
    
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
        
        func centerofEye(_ eye: Eye) -> CGPoint {
            let eyeOffset = skullRadius / Ratios.skullRaduisToEyeOffset
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .left) ? -1 : 1) * eyeOffset
            return eyeCenter
        }
        let eyeRadius = skullRadius / Ratios.skullRaduisToEyeRadius
        let eyeCenter = centerofEye(eye)
        
        let path: UIBezierPath
        if eyesOpen {
            path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        path.lineWidth = 5.0
        }
        else {
            path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x, y: eyeCenter.y))
        }
        return path
    }
    
    private func pathForMouth() -> UIBezierPath {
        
        let mouthWidth = skullRadius / Ratios.skullRaduisToMouthWidth
        let mouthHeight = skullRadius / Ratios.skullRaduisToMouthHeight
        let mouthOffset = skullRadius / Ratios.skullRaduisToMouthOffset
        
        let mouthRect = CGRect(
            x: skullCenter.x - mouthWidth,
            y: skullCenter.y + mouthOffset,
            width: mouthWidth,
            height: mouthHeight
            )
        
        let path = UIBezierPath(rect: mouthRect)
        return path
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
        pathForEye(.left).stroke()
        pathForEye(.right).stroke()
        pathForMouth().stroke()
        
    }
    
    private struct Ratios {
        static let skullRaduisToEyeOffset: CGFloat = 3
        static let skullRaduisToEyeRadius: CGFloat = 10
        static let skullRaduisToMouthWidth: CGFloat = 1
        static let skullRaduisToMouthHeight: CGFloat = 3
        static let skullRaduisToMouthOffset: CGFloat = 3
        
    }

}
