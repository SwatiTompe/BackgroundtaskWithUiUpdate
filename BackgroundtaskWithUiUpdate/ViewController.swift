//
//  ViewController.swift
//  BackgroundtaskWithUiUpdate
//
//  Created by Admin on 23/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            let result = self.performHeavyComputationSafely()
            
            // UI update must happen on the main thread
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                self.statusLabel.text = "Task completed = \(result)"
            }
        }
    }
    
    private func performHeavyComputationSafely() -> Int {
        // Perform heavy computation (no direct UI or main-thread dependencies)
        Thread.sleep(forTimeInterval: 2) // Simulate time-consuming task
        
        var sum = 0
        for i in 1...10_000_000 {
            sum += i
        }
        return sum
    }
    
}

