//
//  ViewController.swift
//  E
//
//  Created by Nyein Nyein on 13/3/21.
//

import UIKit
var counter=0
class ViewController: UIViewController {
    @IBOutlet weak var EINPUTTEXT: UILabel!
    
    @IBOutlet weak var SMOLNUTELLA: UIImageView!
    
    @IBOutlet weak var NUTELLAA: UIImageView!
    
    @IBOutlet weak var EOutput: UILabel!

    @IBOutlet weak var EInput: UIButton!
    
    @IBOutlet weak var CONGRATSS: UILabel!
    
    @IBOutlet weak var OLDMESSAGE: UILabel!
    
    override func viewDidLoad() {
        EInput.layer.cornerRadius = 15
        EInput.layer.masksToBounds = true
        
        EOutput.layer.cornerRadius = 15
        EOutput.layer.masksToBounds = true
        
        OLDMESSAGE.text=""
        CONGRATSS.text=""
        
        EOutput.adjustsFontSizeToFitWidth = true
        EOutput.minimumScaleFactor = 0.2
        
        CONGRATSS.adjustsFontSizeToFitWidth = true
        CONGRATSS.minimumScaleFactor = 0.2
        
        EINPUTTEXT.adjustsFontSizeToFitWidth = true
        EINPUTTEXT.minimumScaleFactor = 0.2
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func RESET(_ sender: Any) {
        if counter > 337{
            counter=0
            OLDMESSAGE.text = CONGRATSS.text //set oldText
            CONGRATSS.text = "you invoked the nutellagod to reset."
            EOutput.text="you ate \(counter) jars of nutella"
            OLDMESSAGE.alpha = 1
            UIView.animate(withDuration: 3){
                self.OLDMESSAGE.alpha = 0
            }
        }else {
            // Get Width and Height of Screen
            let width = UIScreen.main.bounds.width
            let height = UIScreen.main.bounds.height
                    
            // Get Random Number for X and Y Under Upper Bound
            let x = Int(arc4random_uniform(UInt32(width)))
            let y = Int(arc4random_uniform(UInt32(height)))
                    
            // Create Image View
            let randomView = UIImageView(frame: CGRect(x: x, y: y, width: 20, height: 20))
            randomView.image = UIImage(named: "0.png") // set image here
                    
            // Add Image as Subview
            view.addSubview(randomView)
        }
    }
    
    @IBAction func EPressed(_ sender: Any) {
        //get random shake offset
        var xrandom=0.0
        var yrandom=1.0
        
        var random=Int.random(in: 1 ... 2)
        if random==1{
            yrandom = -0.5
        }else{
            yrandom=0.5
        }
        
        random=Int.random(in: 1 ... 2)
        if random==1{
            xrandom = -0.5
        }else{
            xrandom=0.5
        }
            
        //shake smol nutella
        self.view.addSubview(SMOLNUTELLA)
        let SMOLNUTELLASHAKEANIMATION = CABasicAnimation(keyPath: "position")
        SMOLNUTELLASHAKEANIMATION.duration = 0.07
        SMOLNUTELLASHAKEANIMATION.repeatCount = 1
        SMOLNUTELLASHAKEANIMATION.autoreverses = true
        SMOLNUTELLASHAKEANIMATION.fromValue = NSValue(cgPoint: CGPoint(x: SMOLNUTELLA.center.x + CGFloat(xrandom), y: SMOLNUTELLA.center.y + CGFloat(yrandom)))
        SMOLNUTELLASHAKEANIMATION.toValue = NSValue(cgPoint: CGPoint(x: SMOLNUTELLA.center.x - CGFloat(xrandom), y: SMOLNUTELLA.center.y + CGFloat(yrandom)))
        SMOLNUTELLA.layer.add(SMOLNUTELLASHAKEANIMATION, forKey: "position")
        
        counter+=1
        
        let messages=[1 : "First steps!!!",
                      10 : "seems like you like it",
                      30 : "wow you really like it",
                      50 : "oh no. you're addicted",
                      70 : "you're getting fat. STOP!",
                      100 : "YOU HAVE PREDIABETES!! TURN BACK BEFORE IT GETS WORSE",
                      130 : "YOU HAVE DIABETES!!! STOP ITT NOW!",
                      160 : "YOU HAVE ADVANCED DIABETES AND NEED TO GO DIALYSIS NOW!! STOP IT!!!",
                      190 : "Youre hospitalised. look what you have done to yourself.",
                      200 : "ARE YOU EATING NUTTELA IN THE HOSPITAL???",
                      210 : "i give up stopping you. its your life",
                      225 : "YOURE DEAD. ENJOY HEAVEN!",
                      235 : "eating nuttella in heaven. as expected.",
                      265 : "wait you are sick? i thought this was heaven",
                      295 : "HOW DID YOU EAT YOUSELF TO DEATH IN HEAVEN??",
                      305 : "You are reborn and the first thing you do is look for nutella. how predictable",
                      315 : "HOW DID YOU FIND NUTELLA??",
                      322 : "You ate nuttela and died instantly after you are born. I have lost all hope in you.",
                      332 : "god has forsaken you. you are not reborn.",
                      342 : "you are free to eat nuttella in the void."] //all messages
        
        if let message = messages[counter] {
            OLDMESSAGE.text = CONGRATSS.text //set oldText
            CONGRATSS.text = message
            OLDMESSAGE.alpha = 1
            UIView.animate(withDuration: 3){
                self.OLDMESSAGE.alpha = 0
            }
        }
        EOutput.text="You ate \(counter) jars of nutella"
    }
    
}

