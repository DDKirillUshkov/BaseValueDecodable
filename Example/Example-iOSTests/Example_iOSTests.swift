//
//  Example_iOSTests.swift
//  Example-iOSTests
//
//  Created by Anatolij Klimenko on 09.08.2021.
//

import XCTest
import BaseValueDecodable

@testable import Example_iOS

class Example_iOSTests: XCTestCase {

    struct Test: Codable {
        let key: BaseValueDecodable
    }
    
    private struct Constants {
        static var anyString = "Test String"
        static var anyIntString = "264"
        static var trueString = "true"
        static var falseString = "false"
        static var oneString = "1"
        static var zeroString = "0"
        static var testBool = true
        static var zeroInt = 0
        static var oneInt = 1
        static var anyInt = 264
        static var zeroDouble = 0.0
        static var oneDouble = 1.0
        static var anyDouble = 264.0
        static var testDouble = 3.14
    }

    func testNonEmptyStringValue() throws {
        let json = "{ \"key\": \"\" }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.nonEmptyStringValue == nil, "Invalid decoding")
    }
    
    func testAnyStringValue() throws {
        let json = "{ \"key\": \"\(Constants.anyString)\" }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.anyString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == nil, "Invalid decoding")
        XCTAssert(value?.intValue == nil, "Invalid decoding")
        XCTAssert(value?.doubleValue == nil, "Invalid decoding")
    }
    func testTrueStringValue() {
        let json = "{ \"key\": \"\(Constants.trueString)\" }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.trueString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == true, "Invalid decoding")
        XCTAssert(value?.intValue == nil, "Invalid decoding")
        XCTAssert(value?.doubleValue == nil, "Invalid decoding")
    }
    func testFalseStringvalue() {
        let json = "{ \"key\": \"\(Constants.falseString)\" }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.falseString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == false, "Invalid decoding")
        XCTAssert(value?.intValue == nil, "Invalid decoding")
        XCTAssert(value?.doubleValue == nil, "Invalid decoding")
    }
    func testZeroStringValue() {
        let json = "{ \"key\": \"\(Constants.zeroString)\" }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.zeroString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == false, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.zeroInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.zeroDouble, "Invalid decoding")
    }
    func testOneStringValue() {
        let json = "{ \"key\": \"\(Constants.oneString)\" }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.oneString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == true, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.oneInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.oneDouble, "Invalid decoding")
    }
    func testIntStringValue() {
        let json = "{ \"key\": \(Constants.anyInt) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.anyIntString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == true, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.anyInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.anyDouble, "Invalid decoding")
    }
    func testDoubleStringValue() {
        let json = "{ \"key\": \(Constants.anyDouble) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.anyIntString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == true, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.anyInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.anyDouble, "Invalid decoding")
    }
 
    
    func testTrueBoolValue() {
        let json = "{ \"key\": \(true) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == nil, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue == nil, "Invalid decoding")
        XCTAssert(value?.boolValue == true, "Invalid decoding")
        XCTAssert(value?.intValue == nil, "Invalid decoding")
        XCTAssert(value?.doubleValue == nil, "Invalid decoding")
    }
    func testFalseBoolValue() {
        let json = "{ \"key\": \(false) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == nil, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue == nil, "Invalid decoding")
        XCTAssert(value?.boolValue == false, "Invalid decoding")
        XCTAssert(value?.intValue == nil, "Invalid decoding")
        XCTAssert(value?.doubleValue == nil, "Invalid decoding")
    }
    
    func testZeroIntValue() {
        let json = "{ \"key\": \(Constants.zeroInt) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.zeroString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == false, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.zeroInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.zeroDouble, "Invalid decoding")
    }
    func testOneIntValue() {
        let json = "{ \"key\": \(Constants.oneInt) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.oneString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == true, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.oneInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.oneDouble, "Invalid decoding")
    }
    func testAnyIntValue() {
        let json = "{ \"key\": \(Constants.anyInt) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.anyIntString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == true, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.anyInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.anyDouble, "Invalid decoding")
    }
    
    func testZeroDoubleValue() {
        let json = "{ \"key\": \(Constants.zeroDouble) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.zeroString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == false, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.zeroInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.zeroDouble, "Invalid decoding")
    }
    func testOneDoubleValue() {
        let json = "{ \"key\": \(Constants.oneDouble) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.oneString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == true, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.oneInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.oneDouble, "Invalid decoding")
    }
    func testAnyDoubleValue() {
        let json = "{ \"key\": \(Constants.anyDouble) }"
        guard let data = json.data(using: .utf8) else {
            XCTAssert(false, "Can't convet data to string")
            return
        }
        let test = try? JSONDecoder().decode(Test.self, from: data)
        let value = test?.key
        XCTAssert(value?.stringValue == Constants.anyIntString, "Invalid decoding")
        XCTAssert(value?.nonEmptyStringValue != nil, "Invalid decoding")
        XCTAssert(value?.boolValue == true, "Invalid decoding")
        XCTAssert(value?.intValue == Constants.anyInt, "Invalid decoding")
        XCTAssert(value?.doubleValue == Constants.anyDouble, "Invalid decoding")
    }
}
