//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Ralbatr on 15/6/15.
//  Copyright (c) 2015年 ralbatr Yi. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController ,FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSourece = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    var happiness: Int = 100 { // 0 = very sad 非常悲伤,100 = ecstatic 非常高兴
        didSet {
            happiness = min(max(happiness, 0) ,100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    private func updateUI()
    {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }

}
