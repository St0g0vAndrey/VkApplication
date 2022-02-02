//
//  AllGroupTableVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 27.12.2021.
//

import UIKit

final class AllGroupTableVC: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBarText: UISearchBar!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "groupCell")
        searchBarText.delegate = self
    }
    
    var searchActive: Bool {
        if searchBarText.text == "" {
            return false
        } else {
            return true
        }
    }

    var myGroup: [GroupModel] = [
        GroupModel(groupName: .BarberHop, groupEmblem: .BarberHop),
        GroupModel(groupName: .Pizza, groupEmblem: .Pizza),
        GroupModel(groupName: .Komsomolsk, groupEmblem: .Komsomolsk),
    ]
    
    // MARK: - Colection Image and Group.name
    var arrayGruop: [GroupModel] {
        if searchActive {
            return myGroup.filter({ (name: GroupModel) -> Bool in
                return name.groupName.rawValue.range(of: searchBarText.text ?? "", options: .caseInsensitive, range: nil, locale: nil) != nil
                })
        } else {
            return myGroup
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayGruop.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell
        else {
            return UITableViewCell()
        }
        let corentGroup = arrayGruop[indexPath.row]
        cell.configure(emblem: UIImage(named: corentGroup.groupEmblem.rawValue) ?? UIImage(), name: corentGroup.groupName.rawValue)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        performSegue(withIdentifier: "addGroups", sender: nil)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableView.reloadData()
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


    
    
   
