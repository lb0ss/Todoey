//
//  Item.swift
//  Todoey
//
//  Created by 林博斯 on 4/8/18.
//  Copyright © 2018 Bosi (Terrence) Lin. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String =  ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
