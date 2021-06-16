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
    
    let happyBooks = DataLoader(file: "happyBooks").mediaData
    

    override func viewDidLoad() {
        super.viewDidLoad()
        switch emotion {
            case "happy":
                mood?.text = "happy quote"
                break
            case "sad":
                mood?.text = "sad quote"
                break
            case "angry":
                mood?.text = "angry quote"
                break
            case "nervous":
                mood?.text = "nervous quote"
                break
            default:
                mood?.text = "Something has gone wrong."
                break
        }
        getRecommendations()
    }
    
    @IBAction func refresh(_ sender: Any) {
        getRecommendations()
    }
    
    func getRecommendations() {
        // TODO: Write csv reading, make lists, pick rec (switch case by emotion)
        
        var books : [MediaInfo] = []
        var songs : [MediaInfo] = []
        
        switch emotion {
        
            case "happy":
                books = happyBooks
                songs = happyBooks
                break
            case "sad":
                books = happyBooks
                songs = happyBooks
                break
            case "angry":
                books = happyBooks
                songs = happyBooks
                break
            case "nervous":
                books = happyBooks
                songs = happyBooks
                break
            default:
                print("Something has gone wrong.")
                // do nothing
                break
        }
        
        let bookNum = Int.random(in: 0..<books.count)
        bookTitle?.text = books[bookNum].title
        bookAuthor?.text = "by " + books[bookNum].author
        
        let songNum = Int.random(in: 0..<songs.count)
        songTitle?.text = songs[songNum].title
        songArtist?.text = "by " + songs[songNum].author
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
