//
//  Modals.swift
//  To_Do_List
//
//  Created by Macbook Air on 13/03/22.
//

import UIKit
import RealmSwift


class TaskDM : Object {
    
    @objc dynamic var _id : String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var date : String = ""
    @objc dynamic var priorety : String = ""
    @objc dynamic var isDone : Bool = false
    @objc dynamic var isNotif : Bool = false
    
    override class func primaryKey() -> String? {
        "_id"
    }
    
}
