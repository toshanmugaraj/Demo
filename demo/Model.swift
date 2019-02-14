//
//  Model.swift
//  demo
//
//  Created by RNTBCI45 on 12/02/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var title: String?
    var rows: [Items]?
}

struct Items: Decodable {
    var title: String?
    var description: String?
    var imageHref: String?
}
