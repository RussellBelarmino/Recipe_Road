//
//  HaloHaloStepsViewController.swift
//  Recipe_Road
//
//  Created by CoopStudent on 2022-08-01.
//

import UIKit

class HaloHaloStepsViewController: UIViewController {
    
    @IBOutlet weak var timerLabel1: UILabel!
    @IBOutlet weak var startStopButton1: UIButton!
    @IBOutlet weak var resetButton1: UIButton!
    
    var timer:  Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startStopButton1.setTitleColor(UIColor.green, for: .normal)
        
    }
    

    @IBAction func resetTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Reset Timer?", message: "Are you sure you would like to reset the timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (_) in
            // do nothing
        }))
        
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
            self.count = 0
            self.timer.invalidate()
            self.timerLabel1.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.startStopButton1.setTitle("START", for: .normal)
            self.startStopButton1.setTitleColor(UIColor.green, for: .normal)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startStopTapped(_ sender: Any) {
        if(timerCounting) {
            timerCounting = false
            timer.invalidate()
            startStopButton1.setTitle("START", for: .normal)
            startStopButton1.setTitleColor(UIColor.green, for: .normal)
        } else {
            timerCounting = true
            startStopButton1.setTitle("STOP", for: .normal)
            startStopButton1.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    
    @objc func timerCounter() -> Void {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerLabel1.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
