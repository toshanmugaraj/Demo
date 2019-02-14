//
//  ContentProvider.swift
//  demo
//
//  Created by RNTBCI45 on 12/02/19.
//  Copyright © 2019 demo. All rights reserved.
//

import UIKit

class ContentProvider: NSObject  {
    func getContent(urlString: String, callback:  @escaping ( (Country?) -> Void) ) {
//        if let data = CacheLayer.getData(key: urlString) {
//            let country = try? JSONDecoder().decode(Country.self, from: data)
//            callback(country)
//        }
        NetworkLayer.getContent(forURLString: urlString) { (data, error) in
            if let resultData = data, let asciString = String(data: resultData, encoding: .ascii), let utfData = asciString.data(using: .utf8) {
//                    CacheLayer.cache(data: utfData, key: urlString)
                    let country = try? JSONDecoder().decode(Country.self, from: utfData)
                    DispatchQueue.main.async {
                        callback(country)
                    }
            }
        }
    }
}

