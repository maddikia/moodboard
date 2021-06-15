//
//  ViewController.swift
//  moodboard
//
//  Created by Madison Ramos on 6/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var angryButton: UIButton!
    @IBOutlet weak var nervousButton: UIButton!
    var emotion : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func happyTapped(_ sender: Any) {
        emotion = "happy"
    }
    
    // renamed because compiles alphabetically
    @IBAction func emotionSadTapped(_ sender: Any) {
        emotion = "sad"
    }
    
    @IBAction func angryTapped(_ sender: Any) {
        emotion = "angry"
    }
    
    @IBAction func nervousTapped(_ sender: Any) {
        emotion = "nervous"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RecommendationViewController {
            //print(self.emotion)
            let vc = segue.destination as? RecommendationViewController
            vc?.emotion = self.emotion
        }
    }
}

