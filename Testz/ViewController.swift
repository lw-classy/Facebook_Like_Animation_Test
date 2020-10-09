//
//  ViewController.swift
//  Testz
//
//  Created by LevinJungstier on 08.10.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let bezierPath: UIView = {
        let container = UIView()
        container.backgroundColor = .brown
        
        return container
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemTeal
        
        
        
        
        setupLongPressureGesture()
    }

    fileprivate func setupLongPressureGesture(){
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressureGesture)))
    }
    
    @objc func handleLongPressureGesture(gesture: UILongPressGestureRecognizer){
        
        
        if gesture.state == .began{
            let pressedLocation = gesture.location(in: self.view)
            
           
            (0...10).forEach { (_) in
                
                let dimension = 20 + drand48() * 10
                let testi = UIView(frame: CGRect(x: 0, y: 0, width: dimension, height: dimension))
                testi.backgroundColor = .red
                let animation = CAKeyframeAnimation(keyPath: "position")
                animation.path = customPath(x: pressedLocation.x, y: pressedLocation.y).cgPath
                animation.duration = 1 + drand48() * 5
                animation.fillMode = CAMediaTimingFillMode.forwards
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                animation.isRemovedOnCompletion = true
                
                testi.layer.add(animation, forKey: nil)
                
                
                self.view.addSubview(testi)
                
            }
            
            
           
            
        
        }else if gesture.state == .ended {
            
        }
       
    }

}

func customPath(x: CGFloat, y: CGFloat) -> UIBezierPath {
    let path = UIBezierPath()
    let randomXShift = x + CGFloat(drand48()) *  100
    
    path.move(to: CGPoint(x: x, y: y))
    path.addCurve(to: CGPoint(x:x, y: y-(y/2)), controlPoint1: CGPoint(x:x - randomXShift, y: y - 66.6666), controlPoint2: CGPoint(x: x + randomXShift, y: y - 133.3333))
    print(x, y)
    return path
}
