//
//  PersistenceSetting.swift
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

/// Generic protocol representing persistence setting
public protocol PersistenceSetting: PersistenceSettingBase {
    associatedtype T

    /// Default value in case ther is no current value.
    var defaultValue: T { get }

    /// Current value for the setting.
    var value: T { get set }

    /// Observable of value changed.
    var valueChanged: Observable<T> { get }

    /// Format value and return as String
    ///
    /// - Parameter value: Value to be formatted
    /// - Returns: Formatted value as String
    func format(value: T) -> String
}

public extension PersistenceSetting {
    /// Formatted value as String.
    var formattedValueString: String {
        return format(value: value)
    }
}

// MARK: - Reactive extension
public extension Reactive where Base: PersistenceSetting {
    /// Observable of value change.
    var valueChanged: Observable<Base.T> {
        return base.valueChanged
    }
}

