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
    let sadBooks = DataLoader(file: "sadBooks").mediaData
    let angryBooks = DataLoader(file: "angryBooks").mediaData
    let nervousBooks = DataLoader(file: "nervousBooks").mediaData
    
    let happySongs = DataLoader(file: "happySongs").mediaData
    let sadSongs = DataLoader(file: "sadSongs").mediaData
    let angrySongs = DataLoader(file: "angrySongs").mediaData
    let nervousSongs = DataLoader(file: "nervousSongs").mediaData
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mood?.numberOfLines = 0
        mood?.lineBreakMode = .byWordWrapping
        switch emotion {
            case "happy":
                mood?.text = "The simplest things can bring the most happiness."
                yellowBackground()
                break
            case "sad":
                mood?.text = "Sadness flies away on the wings of time."
                blueBackground()
                break
            case "angry":
                mood?.text = "If you are patient in one moment of anger, you will escape a hundred days of sorrow."
                redBackground()
                break
            case "nervous":
                mood?.text = "Do not anticipate trouble, or worry about what may never happen. Keep in the sunlight."
                greenBackground()
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
        
        var books : [MediaInfo] = []
        var songs : [MediaInfo] = []
        
        switch emotion {
        
            case "happy":
                books = happyBooks
                songs = happySongs
                break
            case "sad":
                books = sadBooks
                songs = sadSongs
                break
            case "angry":
                books = angryBooks
                songs = angrySongs
                break
            case "nervous":
                books = nervousBooks
                songs = nervousSongs
                break
            default:
                print("Something has gone wrong.")
                // do nothing
                break
        }
        
        // ensure proper wrapping
        bookTitle?.lineBreakMode = .byWordWrapping
        songTitle?.lineBreakMode = .byWordWrapping
        bookAuthor?.lineBreakMode = .byWordWrapping
        songArtist?.lineBreakMode = .byWordWrapping
        bookTitle?.numberOfLines = 0;
        songTitle?.numberOfLines = 0;
        bookAuthor?.numberOfLines = 0
        songArtist?.numberOfLines = 0
        
        // randomly select emotion-specific book/song
        let bookNum = Int.random(in: 0..<books.count)
        bookTitle?.text = books[bookNum].title
        bookAuthor?.text = "by " + books[bookNum].author
        
        let songNum = Int.random(in: 0..<songs.count)
        songTitle?.text = songs[songNum].title
        songArtist?.text = "by " + songs[songNum].author
    }
    
    func yellowBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor.init(red: 0.97,  green: 0.84, blue: 0.15, alpha: 1.00).cgColor, UIColor.init(red: 0.97,  green: 0.84, blue: 0.15, alpha: 1.00).cgColor, UIColor.init(red: 1.00, green: 0.93, blue: 0.60, alpha: 1.00).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

    func blueBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor.init(red: 0.51, green: 0.74, blue: 0.77, alpha: 1.00).cgColor, UIColor.init(red: 0.51, green: 0.74, blue: 0.77, alpha: 1.00).cgColor, UIColor.init(red: 0.62, green: 0.80, blue: 0.82, alpha: 1.00).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    func redBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor.init(red: 0.91, green: 0.42, blue: 0.37, alpha: 1.00).cgColor, UIColor.init(red: 0.91, green: 0.42, blue: 0.37, alpha: 1.00).cgColor, UIColor.init(red: 1.00, green: 0.52, blue: 0.54, alpha: 1.00).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    func greenBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor.init(red: 0.51, green: 0.93, blue: 0.60, alpha: 1.00).cgColor, UIColor.init(red: 0.51, green: 0.93, blue: 0.60, alpha: 1.00).cgColor, UIColor.init(red: 0.70, green: 0.98, blue: 0.76, alpha: 1.00).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func addReadingTapped(_ sender: Any) {
        // we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let book = ReadingListCD(entity: ReadingListCD.entity(), insertInto: context)
            book.title = bookTitle?.text
            book.author = bookAuthor?.text
            try? context.save()
        }
    }
    
    
    @IBAction func addSongTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let song = SongListCD(entity: SongListCD.entity(), insertInto: context)
            song.title = songTitle?.text
            song.author = songArtist?.text
            try? context.save()
        }
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
