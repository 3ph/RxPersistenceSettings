//
//  NumericUserDefaultsSetting.swift
//  RxPersistenceSettings
//
//  Created by Tomas Friml on 6/04/18.
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

/// Numeric specialization of the persisted setting with underlaying UserDefaults
/// persistence store.
public class NumericUserDefaultsSetting<Type: Numeric & CustomStringConvertible>:
    UserDefaultsSetting<Type> {

    override public var isAtMax: Bool {
        return value == _max
    }

    override public var isAtMin: Bool {
        return value == _min
    }

    override public func increase() {
        if isAtMax == false {
            value += _step
        }
    }

    override public func decrease() {
        if isAtMin == false {
            value -= _step
        }
    }

    /// Simplified constructor without setting metadata.
    ///
    /// - Parameters:
    ///   - key: UserDefaults key
    ///   - defaultValue: Default value if no value is present
    ///   - min: Minimal allowed value
    ///   - max: Maximal allowed value
    ///   - step: Increase/decrease step for the setting's value
    public init(key: String, defaultValue: Type, min: Type, max: Type, step: Type) {
        _min = min
        _max = max
        _step = step
        super.init(key: key, defaultValue: defaultValue)
    }
    
    /// Full constructor with metadata.
    ///
    /// - Parameters:
    ///   - titleString: Title string for the setting
    ///   - infoString: Info string for the setting
    ///   - key: UserDefaults key
    ///   - defaultValue: Default value if no value is present
    ///   - min: Minimal allowed value
    ///   - max: Maximal allowed value
    ///   - step: Increase/decrease step for the setting's value
    public init(titleString: String, infoString: String, key: String, defaultValue: Type, min: Type, max: Type, step: Type) {
        _min = min
        _max = max
        _step = step
        super.init(titleString: titleString, infoString: infoString, key: key, defaultValue: defaultValue)
    }

    // MARK: - Private
    fileprivate let _min: Type  /// Minimal allowed value for the setting.
    fileprivate let _max: Type  /// Maximal allowed value for the setting.
    fileprivate let _step: Type /// Increase/decrease step for the setting's value.
}
