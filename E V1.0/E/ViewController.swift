//
//  ViewController.swift
//  E
//
//  Created by Nyein Nyein on 13/3/21.
//

import UIKit
var counter=0
class ViewController: UIViewController {
    @IBOutlet weak var EOutput: UILabel!

    @IBOutlet weak var EInput: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func EPressed(_ sender: Any) {
        counter+=1
        EOutput.text="\(counter)"
    }
    
}

