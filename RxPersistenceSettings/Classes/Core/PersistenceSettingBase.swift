//
//  PersistenceSettingBase.swift
//  RxPersistenceSettings
//
//  Created by Tomas Friml on 5/04/18.
//
//  MIT License
//
//  Copyright (c) 2018 Tomas Friml
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import RxSwift

/// Generic protocol representing persisted setting. Supports meta data, observe changes,
/// increase, decrease value, etc.
public protocol PersistenceSettingBase: class {
    /// Title of the setting.
    var titleString: String { get }

    /// Detailed info for the setting.
    var infoString: String { get }

    /// Formatted value to be shown in the UI.
    var formattedValueString: String { get }

    /// Determines if setting is of numerical value (rather than set of distinct values).
    var isNumeric: Bool { get }

    /// Determine if value is minimal allowed value.
    var isAtMin: Bool { get }

    /// Determine if value is maximal allowed value.
    var isAtMax: Bool { get }

    /// Increase the value.
    func increase()

    /// Increase the value.
    func decrease()

    /// Observable of formatted value change.
    var formattedValueChanged: Observable<String> { get }
}

public extension Reactive where Base: PersistenceSettingBase {
    /// Observable of formatted value change.
    var formattedValueChanged: Observable<String> {
        return base.formattedValueChanged
    }
}
