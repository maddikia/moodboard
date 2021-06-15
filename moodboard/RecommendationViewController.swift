//
//  RecommendationViewController.swift
//  moodboard
//
//  Created by Madison Ramos on 6/15/21.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songArtist: UILabel!
    @IBOutlet weak var mood: UILabel!
    
    var emotion : String = "n/a"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mood?.text = emotion
        getRecommendations()
    }
    
    @IBAction func refresh(_ sender: Any) {
        getRecommendations()
    }
    
    func getRecommendations() {
        // TODO: Write csv reading, make lists, pick rec (switch case by emotion)
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
