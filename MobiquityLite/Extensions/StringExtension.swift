//
//  StringExtension.swift
//  MobiquityLite
//
//  Created by Koushal, KumarAjitesh on 2019/11/25.
//  Copyright © 2019 Koushal, KumarAjitesh. All rights reserved.
//

import Foundation

protocol SearchTextSpaceRemover{}

extension String: SearchTextSpaceRemover {
    public var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension SearchTextSpaceRemover where Self == String {
    
    //MARK: - Removing space from String
    var removeSpace: String {
        if self.isNotEmpty {
           return self.components(separatedBy: .whitespaces).joined()
        }else{
           return ""
        }
    }
}
