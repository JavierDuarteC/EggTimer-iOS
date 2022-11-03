//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 420, "Hard": 720]
    //Dictionary same as: let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12] minutes
    var isTimerRunning = false
    var secondsRemaining = 0
    var totalTime = 0
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        if !isTimerRunning {
            totalTime = eggTimes[hardness]!
            secondsRemaining = eggTimes[hardness]!
            progressBar.progress = 0.0
            progressBar.progressTintColor = UIColor.orange
            timerLabel.text = hardness
            isTimerRunning = true
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    }

    @objc func updateCounter() {
        //example functionality
        if secondsRemaining > 0 {
            self.timerLabel.text = secondsToClockStyle(secondsRemaining)
            progressBar.progress = 1 - (Float(secondsRemaining) / Float(totalTime))
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            isTimerRunning = false
            progressBar.progress = 1.0
            progressBar.progressTintColor = UIColor.green
            self.timerLabel.text = "Done!"
        }
    }

    func secondsToClockStyle(_ secondsToProcess: Int) -> String { //return type String
        let minutes = secondsToProcess / 60
        var minutesText = ""
        if minutes < 10 {
            minutesText = "0\(minutes)"
        } else {
            minutesText = "\(minutes)"
        }

        let seconds = secondsToProcess % 60
        var secondsText = ""
        if seconds < 10 {
            secondsText = "0\(seconds)"
        } else {
            secondsText = "\(seconds)"
        }

        return "\(minutesText):\(secondsText)"
    }

}
