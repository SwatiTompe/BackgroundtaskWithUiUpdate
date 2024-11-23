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
        self.statusLabel.text = "fetching data"
        
        fetchAPIdata()
    }
    
    private func fetchAPIdata() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!

        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            
            if let error = error {
                print("failed with error \(error)")
                DispatchQueue.main.async {
                    self.statusLabel.text = "failed to load data with error = \(error.localizedDescription)"
                }
                return
            }
            
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any], let title = json["title"] as? String {
                
                DispatchQueue.main.async {
                    self.statusLabel.text = "title = \(title)"
                }
                
            }
            else {
                DispatchQueue.main.async {
                    self.statusLabel.text = "invalid data"
                }
            }
        }
        task.resume()
    }
}

