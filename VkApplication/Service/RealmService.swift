//
//  RealmService.swift
//  VkApplication
//
//  Created by Андрей Стогов on 22.04.2022.
//

import RealmSwift

final class RealmService {
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    
    class func save<T:Object>(
        items: [T],
        configuration: Realm.Configuration = deleteIfMigration,
        update: Realm.UpdatePolicy = .modified) throws {
            
            let realm = try Realm(configuration: configuration)
            print(configuration.fileURL ?? "")
            try realm.write{
                realm.add(
                    items,
                    update: update)
            }
        }
    
    
    class func load<T: Object>(typyof: T.Type) throws -> Results<T>{
        let realm = try Realm()
        return realm.objects(T.self)
    }
    
    class func delete<T:Object>(obj: Results<T>) throws {
        let realm = try Realm()
        try realm.write {
            realm.delete(obj)
        }
    }
    
}
