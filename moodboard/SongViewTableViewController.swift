//
//  ReadingViewTableViewController.swift
//  moodboard
//
//  Created by Madison Ramos on 6/15/21.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    
}
    
class SongViewTableViewController: UITableViewController {
    
    var songs : [SongListCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getSongs() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataSongs = try? context.fetch(SongListCD.fetchRequest()) as? [SongListCD] {
                songs = coreDataSongs
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songIdentifier", for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        cell.songTitle?.text = song.title
        cell.artist?.text = song.author

        return cell
    }
    
    override func viewWillAppear(_ animated : Bool) {
        getSongs()
    
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(songs[indexPath.row])
                do {
                    try context.save()
                } catch {
                    print("Something has gone wrong.")
                }
                songs.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.tableView.reloadData()
            }
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
