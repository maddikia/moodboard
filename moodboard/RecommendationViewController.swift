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
        
        let defaultBooks = ["B1", "B2", "B3", "B4", "B5"]
        let defaultAuthors = ["A1", "A2", "A3", "A4", "A5"]
        let defaultSongs = ["S1", "S2", "S3", "S4", "S5"]
        let defaultArtists = ["A1", "A2", "A3", "A4", "A5"]
        let happyBooks = ["Happy Book 1", "Happy Book 2"]
        let happyBooksAuthors = ["Happy Book 1 Author", "Happy Book 2 Author"]
        
        var bookTitles : [String] = []
        var authorNames : [String] = []
        var songTitles : [String] = []
        var artistNames : [String] = []
        
        switch emotion {
        
            case "happy":
                bookTitles = happyBooks
                authorNames = happyBooksAuthors
                songTitles = defaultSongs
                artistNames = defaultArtists
                break
            case "sad":
                bookTitles = defaultBooks
                authorNames = defaultAuthors
                songTitles = defaultSongs
                artistNames = defaultArtists
                break
            case "angry":
                bookTitles = defaultBooks
                authorNames = defaultAuthors
                songTitles = defaultSongs
                artistNames = defaultArtists
                break
            case "nervous":
                bookTitles = defaultBooks
                authorNames = defaultAuthors
                songTitles = defaultSongs
                artistNames = defaultArtists
                break
            default:
                print("Something has gone wrong.")
                // do nothing
                break
        }
        
        let bookNum = Int.random(in: 0..<bookTitles.count)
        bookTitle?.text = bookTitles[bookNum]
        bookAuthor?.text = "by " + authorNames[bookNum]
        
        let songNum = Int.random(in: 0..<songTitles.count)
        songTitle?.text = songTitles[songNum]
        songArtist?.text = "by " + artistNames[songNum]
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
