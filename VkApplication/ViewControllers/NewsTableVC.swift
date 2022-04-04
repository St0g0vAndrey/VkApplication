//
//  NewsTableVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 30.01.2022.
//

import UIKit

class NewsTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsTableCell", bundle: nil), forCellReuseIdentifier: "newsTableCell")
    }

    var collectionNews = [GroupModel(nameGroups: "GeekBrains", emblemGroup: "https://sun1-56.userapi.com/s/v1/ig2/Z-aPt8MPvgStrmjfCwo-WPK7jrMdYoNUhCbpYgj93XAEZmeVnhMNsfnSVDzdguEzVff4BZfxcC_K87kje-d5L_n9.jpg?size=50x50&quality=95&crop=256,256,2046,2046&ava=1")]
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        collectionNews.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsTableCell", for: indexPath) as? NewsTableCell
        else {
            return UITableViewCell()
        }

        let corentNews = collectionNews[indexPath.row]
        
        cell.configure(photoNews: UIImage(named: corentNews.emblemGroup) ?? UIImage(), titleNews: "Hello",
                       nameGroup: corentNews.nameGroups,
                       groupEmblem: corentNews.emblemGroup)
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
