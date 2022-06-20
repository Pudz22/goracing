//
//  ViewController.swift
//  goracing
//
//  Created by Гость on 20.06.2022.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pcCar: UIImageView!
    @IBOutlet weak var userCar: UIImageView!
    @IBOutlet weak var resulLabel: UILabel!
    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var lineFinish: UIImageView!
    
    
    var stateSemafor: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    
    @objc func pcDrive() {
        
        if stateSemafor == 2 {
            pcCar.center.x += 10
            
        }
        
        if pcCar.center.x > lineFinish.center.x {
            resulLabel.isHighlighted = false
            resulLabel.text = "YOU LOSE!"
            resulLabel.textColor = .red
            timerPC.invalidate()
            timerPC.invalidate()
        }
    }

    @objc func intervalTimer() {
        
        stateSemafor += 1
        
        if stateSemafor > 2 {
            stateSemafor = 1
        }
    
    switch stateSemafor {
    case 1:
        semaforLabel.text = "STOP"
        semaforLabel.textColor = .red
    case 2:
        semaforLabel.text = "DRIVE"
        semaforLabel.textColor = .green
    default:
        break
        }
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        semaforLabel.isHidden = false
        
        
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
}
    
    @IBAction func driveGame(_ sender: UIButton) {
        if stateSemafor == 2 {
            userCar.center.x += 10
    } else if stateSemafor == 1 {
        userCar.center.x -= 10
    }
    
    if userCar.center.x > lineFinish.center.x {
        resulLabel.isHidden = false
        resulLabel.text = "YOU WIN!"
        resulLabel.textColor = .green
        timerPC.invalidate()
        timerPC.invalidate()
     }
    }
    
}
