//
//  ViewController.swift
//  Assignment_2
//
//  Created by user252704 on 6/23/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonTap(_ sender: Any) {
        showAlert();
    }
    func showAlert() {
        let alert = UIAlertController(title: "", message: "No Monitors yet. Check back later!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style:.cancel));
        
        present(alert, animated: true);
    }
    
}

