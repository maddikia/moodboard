//
//  RecommendationViewController.swift
//  moodboard
//
//  Created by Madison Ramos on 6/15/21.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    @IBOutlet weak var mood: UILabel!
    var emotion : String = "n/a"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mood?.text = emotion
        // Do any additional setup after loading the view.
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
