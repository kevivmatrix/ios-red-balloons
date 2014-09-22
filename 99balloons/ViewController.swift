//
//  ViewController.swift
//  99balloons
//
//  Created by vivek on 19/09/14.
//  Copyright (c) 2014 vivek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var balloons:Array<Balloon> = []
    var currentBalloonIndex:Int = 1

    @IBOutlet weak var balloonNameLabel: UILabel!
    @IBOutlet weak var balloonImage: UIImageView!
    
    @IBAction func nextButtonClicked(sender: AnyObject) {
        var randomNumber = Int(arc4random_uniform(UInt32(balloons.count)))
        while (randomNumber == currentBalloonIndex) {
            randomNumber = Int(arc4random_uniform(UInt32(balloons.count)))
        }
        currentBalloonIndex = randomNumber
        var balloon = balloons[currentBalloonIndex]
        balloonNameLabel.text = balloon.name
        balloonImage.image = balloon.image
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for index in 1...99 {
            var randomImageNumber = Int(arc4random_uniform(UInt32(3))) + 1
            var balloon = Balloon(name: "Balloon \(index)", image: UIImage(named: "RedBalloon\(randomImageNumber).jpg"))
            balloons.append(balloon)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

