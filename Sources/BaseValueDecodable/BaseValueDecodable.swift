//
//  BaseValueDecodable.swift
//  Example-iOS
//
//  Created by Anatolij Klimenko on 09.08.2021.
//

import Foundation

protocol ValueDecodable: Codable {
    var stringValue: String? { get }
    var intValue: Int? { get }
    var doubleValue: Double? { get }
    var boolValue: Bool? { get }
    init(from decoder: Decoder) throws
}

open class BaseValueDecodable: ValueDecodable {
    private let innerStringValue: String?
    private let innerBoolValue: Bool?

    open var intValue: Int? {
        guard let string = innerStringValue else { return nil }
        return Int(string)
    }

    open var doubleValue: Double? {
        guard let string = innerStringValue else { return nil }
        return Double(string)
    }

    open var stringValue: String? {
        innerStringValue
    }
    
    open var nonEmptyStringValue: String? {
        guard let innerStringValue = innerStringValue
        else { return nil }
        
        return innerStringValue.isEmpty ? nil : innerStringValue
    }

    open var boolValue: Bool? {
        innerBoolValue
    }

    public init(innerStringValue: String? = nil, innerBoolValue: Bool? = nil) {
        self.innerStringValue = innerStringValue
        self.innerBoolValue = innerBoolValue
    }
    
    required public init(from decoder: Decoder) throws {
        let singleValueContainer = try decoder.singleValueContainer()
        innerStringValue = singleValueContainer.decodeToString()
        innerBoolValue = singleValueContainer.decodeToBool()
    }

    public func encode(to encoder: Encoder) throws {
        if let string = innerStringValue {
            var singleValue = encoder.singleValueContainer()
            try singleValue.encode(string)
        } else if let bool = innerBoolValue {
            var singleValue = encoder.singleValueContainer()
            try singleValue.encode(bool)
        } else {
            throw EncodingError.invalidValue(stringValue ?? "Unknown value", .init(codingPath: [], debugDescription: "Enable to encode"))
        }
    }
}

private extension SingleValueDecodingContainer {
    func decodeToBool() -> Bool? {
        if let bool = try? decode(Bool.self) {
            return bool
        }
        if let string = try? decode(String.self) {
            if string == "1" || string.lowercased() == "true" {
                return true
            } else if string == "0" || string.lowercased() == "false" {
                return false
            } else {
                return nil
            }
        }
        if let int = try? decode(Int.self) {
            return int != 0
        }
        return nil
    }

    func decodeToString() -> String? {
        if let string = try? decode(String.self) {
            return string
        }
        if let int = try? decode(Int.self) {
            return String(int)
        }
        if let double = try? decode(Double.self) {
            return String(double)
        }
        return nil
    }
}
