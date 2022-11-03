//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    @IBOutlet weak var timerLabel: UILabel!

    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    //Dictionary same as: let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12] minutes
    var isTimerRunning = false

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!
        print(result)
        var secondsRemaining = result
        if !isTimerRunning {
            timerLabel.text = hardness
            isTimerRunning = true
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if secondsRemaining > 0 {
                    let minutes = secondsRemaining / 60
                    var minutesText = ""
                    if minutes < 10 {
                        minutesText = "0\(minutes)"
                    } else {
                        minutesText = "\(minutes)"
                    }
                    
                    let seconds = secondsRemaining % 60
                    var secondsText = ""
                    if seconds < 10 {
                        secondsText = "0\(seconds)"
                    } else {
                        secondsText = "\(seconds)"
                    }
                    
                    self.timerLabel.text = "\(minutesText):\(secondsText)"
                    secondsRemaining -= 1
                } else {
                    self.timerLabel.text = "Done!"
                    self.isTimerRunning = false
                    Timer.invalidate()
                }
            }
        }

//        if hardness == "Soft" {
//            print(softTime)
//            return
//        }
//
//        if hardness == "Medium" {
//            print(mediumTime)
//            return
//        }
//
//        if hardness == "Hard" {
//            print(hardTime)
//            return
//        }
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(mediumTime)
//        default:
//            print("Error egg is overcooked")
//        }
    }

}
