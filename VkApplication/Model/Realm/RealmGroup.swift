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
    @Persisted var idGroupRealm: Int = 0
    @Persisted var nameGroup: String = ""
    @Persisted var emblem: String = ""
}

/*
 struct GroupModel {
     let idGroup: Int
     let nameGroups: String
     let emblemGroup: String
 */
