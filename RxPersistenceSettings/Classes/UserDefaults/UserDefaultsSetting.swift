//
//  UserDefaultsSetting.swift
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

/// This represents standard UserDefaults settings - only key and defaultValue, optionally with title and info for the setting.
public class UserDefaultsSetting<Type: CustomStringConvertible>: UserDefaultsSettingBase {
    public typealias T = Type
    
    public var titleString: String {
        return _titleString ?? String()
    }
    
    public var infoString: String {
        return _infoString ?? String()
    }
    
    public var isNumeric: Bool {
        return false
    }
    
    public var isAtMin: Bool {
        return false
    }
    
    public var isAtMax: Bool {
        return false
    }
    
    public func increase() {
    }
    
    public func decrease() {
    }
    
    public var key: String {
        return _key
    }
    
    public var defaultValue: Type {
        return _defaultValue
    }
    
    public func format(value: Type) -> String {
        return "\(value)"
    }

    /// Simplified initializer without setting metadata.
    ///
    /// - Parameters:
    ///   - key: UserDefaults key
    ///   - defaultValue: Default value if no value is present
    public init(key: String, defaultValue: T) {
        _key = key
        _defaultValue = defaultValue
    }
    
    /// Full initializer with metadata.
    ///
    /// - Parameters:
    ///   - titleString: Title string for the setting
    ///   - infoString: Info string for the setting
    ///   - key: UserDefaults key
    ///   - defaultValue: Default value if no value is present
    public init(titleString: String, infoString: String, key: String, defaultValue: T) {
        _key = key
        _defaultValue = defaultValue
        _titleString = titleString
        _infoString = infoString
    }
    
    // MARK: - Private
    fileprivate var _titleString: String?
    fileprivate var _infoString: String?
    fileprivate let _key: String
    fileprivate let _defaultValue: T
}
