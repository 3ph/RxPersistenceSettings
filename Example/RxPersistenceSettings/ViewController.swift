//
//  ViewController.swift
//  RxPersistenceSettings
//
//  Created by 3ph on 04/05/2018.
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

import RxPersistenceSettings
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var updateValueTextField: UITextField!
    @IBOutlet weak var settingsPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _currentSetting = _settings[0].setting
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func decreaseButtonPressed(_ sender: Any) {
        _currentSetting?.decrease()
    }
    
    @IBAction func increaseButtonPressed(_ sender: Any) {
        _currentSetting?.increase()
    }
    @IBAction func updateValueButtonPressed(_ sender: Any) {
        if let setting = _currentSetting as? UserDefaultsSetting<Int>,
            let text = updateValueTextField.text,
            let value = Int(text) {
            setting.value = value
        }
    }
    
    // MARK: - Private
    fileprivate var _disposeBag = DisposeBag()
    
    fileprivate var _currentSetting: PersistenceSettingBase? {
        didSet {
            bindCurrentSetting()
        }
    }
    fileprivate let _settings: [(title: String, setting: PersistenceSettingBase)] = [
        ("Simple Int", UserDefaultsSetting<Int>(key: "simpleIntSettingKey", defaultValue: 10)),
        ("Complex Int", NumericUserDefaultsSetting<Int>(
            titleString: "Number of cats",
            infoString: "This setting holds number of cats",
            key: "complexIntSettingKey",
            defaultValue: 1,
            min: 0,
            max: 13,
            step: 1)),
        ]
    
    fileprivate func bindCurrentSetting() {
        _disposeBag = DisposeBag()
        
        if let setting = _currentSetting {
            setting
                .formattedValueChanged
                .asDriver(onErrorJustReturn: String())
                .drive(onNext: { [unowned self] formattedValueString in
                    self.updateSettingUi(with: formattedValueString)
                }).disposed(by: _disposeBag)
            updateSettingUi(with: setting.formattedValueString)
        }
    }
    
    fileprivate func updateSettingUi(with formattedValueString: String) {
        if let setting = _currentSetting {
            titleLabel.text = setting.titleString
            infoLabel.text = setting.infoString
        }
        valueLabel.text = formattedValueString
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return _settings.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        _currentSetting = _settings[row].setting
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return _settings[row].title
    }
}
