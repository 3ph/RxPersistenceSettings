// https://github.com/Quick/Quick

import Quick
import Nimble
import RxPersistenceSettings

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("Simple UserDefaults test") {

            let setting = UserDefaultsSetting<Int>(key: "simpleIntSettingKey", defaultValue: 10)
            it("Default value") {
                expect(setting.defaultValue) == 10
            }

            it("Update works") {
                setting.value = 13
                expect(setting.value) == 13
            }
        }

        describe("Numeric UserDefaults test") {
            
            let setting = NumericUserDefaultsSetting<Int>(
                titleString: "Number of cats",
                infoString: "This setting holds number of cats",
                key: "complexIntSettingKey",
                defaultValue: 1,
                min: 0,
                max: 13,
                step: 1)

            it("Default value") {
                expect(setting.defaultValue) == 1
            }
            
            it("Increase works") {
                let oldValue = setting.value
                setting.increase()
                expect(setting.value) == oldValue + 1
            }
        }
    }
}
