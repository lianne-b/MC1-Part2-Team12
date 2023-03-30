//
//  fonts.swift
//  CBLTesting
//
//  Created by Sebin Kwon on 2023/03/30.
//
import SwiftUI

extension Font {
    static func registerFonts() {

        self.register(name: "NanumDdoBagDdoBag", withExtension: "ttf")
        self.register(name: "NanumGyuRiEuiIrGi", withExtension: "ttf")
        self.register(name: "NanumDongHwaDdoBag", withExtension: "ttf")
        self.register(name: "NanumDungGeunInYeon", withExtension: "ttf")
        self.register(name: "NanumGgocNaeEum", withExtension: "ttf")
        self.register(name: "NanumMiNiSonGeurSsi", withExtension: "ttf")
        
    }

    static func register(name: String, withExtension: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: withExtension),CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        else { return print("failed to regist \(name) font") }
    }
}
