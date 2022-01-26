//
//  NewsViewTC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 27.01.2022.
//

import Foundation
import UIKit

final class NewsViewTC: UITableViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsCellTableViewCell", bundle: nil), forCellReuseIdentifier: "newsCellTableViewCell")

    }
    
}
