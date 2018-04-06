//
//  UserDefaultsSetting.swift
//  RxPersistence
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

import RxCocoa
import RxSwift

/// Persisted setting protocol with underlaying UserDefault store.
public protocol UserDefaultsSettingBase: PersistenceSetting {
    /// Key in user defaults for this persisted value.
    var key: String { get }
}

public extension UserDefaultsSettingBase {
    /// Observable of formatted value change.
    var formattedValueChanged: Observable<String> {
        return valueChanged
            .map({ [unowned self] value in
                return self.format(value: value)
            })
    }

    /// Observable of value change.
    var valueChanged: Observable<T> {
        return
            UserDefaults.standard
                .rx
                .observe(T.self, key)
                //.debounce(0.01, scheduler: MainScheduler.instance)   // iOS 10.2 bug
                .map({ value -> T in
                    return value ?? self.defaultValue
                })
    }

    /// Underlaying value for the setting.
    var value: T {
        set { UserDefaults.standard.set(newValue, forKey: key) }
        get { return UserDefaults.standard.value(forKey: key) as? T ?? defaultValue }
    }
}
