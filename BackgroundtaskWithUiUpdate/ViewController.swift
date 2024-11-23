//
//  ViewController.swift
//  BackgroundtaskWithUiUpdate
//
//  Created by Admin on 23/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            
            let str1: String? = self.simulateTask(with: "Task1", duration: 2)
            if let taskTitle1 = str1 {
                DispatchQueue.main.async {
                    self.Label1.text = taskTitle1
                }
            }
        }
        
        DispatchQueue.global().async {
            let str2: String? = self.simulateTask(with: "Task2", duration: 3)
            if let taskTitle2 = str2 {
                DispatchQueue.main.async {
                    self.Label2.text = taskTitle2
                }
            }
        }
        
        DispatchQueue.global().async {
            let str3:String? = self.simulateTask(with: "Task3", duration: 1)
            if let taskTitle3 = str3 {
                DispatchQueue.main.async {
                    self.Label3.text = taskTitle3
                }
            }
        }
    }
    
    private func simulateTask(with Title:String, duration:Int) -> String {
        sleep(UInt32(duration))
        return "\(Title) completed"
    }
    
}

