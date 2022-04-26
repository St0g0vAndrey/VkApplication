//
//  RealmGroup.swift
//  VkApplication
//
//  Created by Андрей Стогов on 24.04.2022.
//

import Foundation
import RealmSwift

class RealmGroup: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted(indexed: true) var nameGroup: String = ""
    @Persisted var idGroupRealm: Int = 0
    @Persisted var emblem: String = ""
}

extension RealmGroup {
    convenience init(groupM: GroupModel) {
        self.init()
        self.nameGroup = groupM.nameGroups
        self.idGroupRealm = groupM.idGroup
        self.emblem = groupM.emblemGroup
    }
}
