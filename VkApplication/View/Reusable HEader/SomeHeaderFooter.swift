//
//  SomeHeaderFooter.swift
//  VkApplication
//
//  Created by Андрей Стогов on 27.01.2022.
//

import UIKit

class SomeHeaderFooter: UITableViewHeaderFooterView {

    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = "Some text"
        //detailTextLabel?.text = "Some Label"
    }

}
