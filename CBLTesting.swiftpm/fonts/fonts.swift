//
//  fonts.swift
//  CBLTesting
//
//  Created by Sebin Kwon on 2023/03/30.
//

import SwiftUI

extension Font {
    static func registerFonts() {
        
        self.register(name: "NanumGyuRiEuiIrGi", withExtension: "ttf")
//        self.register(name: "NotoSansKR-Bold", withExtension: "otf")
//        self.register(name: "NotoSansKR-Regular", withExtension: "otf")
        
    }
    
    static func register(name: String, withExtension: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: withExtension),CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        else { return print("failed to regist \(name) font") }
    }
}
