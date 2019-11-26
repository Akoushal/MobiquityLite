//
//  URLSessionExtension.swift
//  MobiquityLite
//
//  Created by Koushal, KumarAjitesh on 2019/11/25.
//  Copyright © 2019 Koushal, KumarAjitesh. All rights reserved.
//

import Foundation

//MARK: - URLSession response handlers
extension URLSession: RequestFlickrImages {
    
    fileprivate func codableTask<T: Codable>(with url: URL, decodingType: T.Type, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
}

extension RequestFlickrImages where Self: URLSession {
    
    func photosTask<T: Codable>(with url: URL, decodingType: T.Type, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, decodingType: decodingType, completionHandler: completionHandler)
    }
}
