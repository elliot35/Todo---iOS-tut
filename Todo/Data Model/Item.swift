//
//  Data.swift
//  Todo
//
//  Created by ElliotMo on 30/7/18.
//  Copyright © 2018 Elliot He. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title : String = ""
    @objc dynamic var selected : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
