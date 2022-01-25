//
//  MyFreindsTC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 27.12.2021.
//

import UIKit

final class MyFreindsTC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "groupCell")

    }

    //MARK: - Collections Image and FIO
    var myFreinds = [
        UserModel(username: "Mark Laletin", userPhoto: "Boy1.jpg", userPhotoCollection: ["Active1","Active2"]),
        UserModel(username: "Jenny Allen", userPhoto: "Woomen3.jpg", userPhotoCollection: ["Active3", "Active4"]),
        UserModel(username: "Amanda Vilson", userPhoto: "Woomen1.jpg", userPhotoCollection: ["Active5", "Active6","ActiveBolgariy"]),
        UserModel(username: "Rogers Jones", userPhoto: "Boy2.jpg", userPhotoCollection: ["ActiveNight1","ActiveKipr"]),
        UserModel(username: "Ariel Theron", userPhoto: "Woomen2.jpg", userPhotoCollection: ["autumn","SnowFreinds","People"])
    ]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myFreinds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
        else {
            return UITableViewCell()
        }

        let freinds = myFreinds[indexPath.row]
        
        if let photo = freinds.userPhoto {
            cell.configure(emblem: UIImage(named: photo) ?? UIImage(), name: freinds.username)
        } else {
            cell.configure(emblem: UIImage(named: "Avatar") ?? UIImage(), name: freinds.username)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        performSegue(withIdentifier: "showPhoto", sender: nil)
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
