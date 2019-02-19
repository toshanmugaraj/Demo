//
//  NetworkLayer.swift
//  demo
//
//  Created by RNTBCI45 on 12/02/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation

struct NetworkLayer {
    static let shared = NetworkLayer()
    private init(){}
    
    static func getContent(forURLString: String, callback: @escaping ( (Data?, Error?) -> Void) ) {
        guard let url = URL.init(string: forURLString) else { return }
        
        URLSession.shared.downloadTask(with: url) { (localUrl, response, error) in
            if let localUrl = localUrl {
                let data = try? Data.init(contentsOf: localUrl, options: .uncached)
                callback(data, error)
            } else {
                callback(nil, error)
            }
        }.resume()
    }
}
