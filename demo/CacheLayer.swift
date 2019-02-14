//
//  CacheLayer.swift
//  demo
//
//  Created by RNTBCI45 on 12/02/19.
//  Copyright © 2019 demo. All rights reserved.
//

import Foundation

final class CacheLayer {
    static func cache(data: Data, key: String) {
        var hasher = Hasher()
        hasher.combine(key)
        let hash = hasher.finalize()
        if let filePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
            var finalFilePath = filePath.appendingPathComponent("DemoCache", isDirectory: true)
            do {
                try FileManager.default.createDirectory(at: finalFilePath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
            finalFilePath.appendPathComponent("\(hash)")
            try? data.write(to: finalFilePath)
        }
    }
    static func getData(key: String) -> Data? {
        var hasher = Hasher()
        hasher.combine(key)
        let hash = hasher.finalize()
        
        if let filePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
            var finalFilePath = filePath.appendingPathComponent("DemoCache", isDirectory: true)
            finalFilePath.appendPathComponent("\(hash)")
            return try? Data.init(contentsOf: finalFilePath)
        }
        return nil
    }
}
