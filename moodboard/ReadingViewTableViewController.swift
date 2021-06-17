//
//  ReadingViewTableViewController.swift
//  moodboard
//
//  Created by Madison Ramos on 6/15/21.
//

import UIKit

class ReadingTableViewCell: UITableViewCell {
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var author: UILabel!
}

class ReadingViewTableViewController: UITableViewController {
    
    var books : [ReadingListCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getBooks() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataBooks = try? context.fetch(ReadingListCD.fetchRequest()) as? [ReadingListCD] {
                books = coreDataBooks
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
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "readIdentifier", for: indexPath) as! ReadingTableViewCell
        let book = books[indexPath.row]
        cell.bookTitle?.text = book.title
        cell.author?.text = book.author

        return cell
    }
    
    override func viewWillAppear(_ animated : Bool) {
        getBooks()
    
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(books[indexPath.row])
                do {
                    try context.save()
                } catch {
                    print("Something has gone wrong.")
                }
                books.remove(at: indexPath.row)
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
