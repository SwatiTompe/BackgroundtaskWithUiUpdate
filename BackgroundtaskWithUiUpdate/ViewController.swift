//
//  ViewController.swift
//  BackgroundtaskWithUiUpdate
//
//  Created by Admin on 23/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // DownloadAndprocessImage()
        
        DispatchQueue.global().async {
            
            let image: UIImage? = self.DownloadAndprocessImage()

            if let image = image {
                
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
    
    private func DownloadAndprocessImage() -> UIImage {
        
        let url = URL(string: "https://via.placeholder.com/150")!
        
        if let data = try? Data(contentsOf: url) {
            return UIImage(data: data)!
        }
        return UIImage()
        
    }
}

