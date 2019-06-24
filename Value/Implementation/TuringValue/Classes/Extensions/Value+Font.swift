//
//  Value+Font.swift
//  TuringValue
//
//  Created by Dmitry Rybochkin on 14/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import UIKit

extension TuringValue {

    // MARK: - Functions

    public func font(_ fontName: String) -> Self {
        self.fontName = fontName
        return self
    }

    // MARK: - Private functions

    private func getFont(_ fontName: String?, fontSize: CGFloat) -> UIFont {
        guard let fontName = fontName != nil ? fontName : self.fontName else {
            showError(message: "font name not specified")
            return UIFont.systemFont(ofSize: UIFont.systemFontSize)
        }
        guard let font = UIFont(name: fontName, size: fontSize) else {
            showError(message: "font \(fontName)[\(fontSize)] not found")
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }
}

// MARK: - Public functions

extension TuringValue where T == CGFloat {

    public func getFont(_ fontName: String? = nil) -> UIFont {
        return getFont(fontName, fontSize: get())
    }
}

extension TuringValue where T == Double {

    public func getFont(_ fontName: String? = nil) -> UIFont {
        return getFont(fontName, fontSize: CGFloat(get()))
    }
}

extension TuringValue where T == Float {

    public func getFont(_ fontName: String? = nil) -> UIFont {
        return getFont(fontName, fontSize: CGFloat(get()))
    }
}

extension TuringValue where T: SignedInteger {

    public func getFont(_ fontName: String? = nil) -> UIFont {
        return getFont(fontName, fontSize: CGFloat(get()))
    }
}

extension TuringValue where T: UnsignedInteger {

    public func getFont(_ fontName: String? = nil) -> UIFont {
        return getFont(fontName, fontSize: CGFloat(get()))
    }
}
