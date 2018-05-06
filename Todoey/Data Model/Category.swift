//
//  Category.swift
//  Todoey
//
//  Created by 林博斯 on 3/31/18.
//  Copyright © 2018 Bosi (Terrence) Lin. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}

