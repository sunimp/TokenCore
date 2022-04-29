//
//  String+Extension.swift
//  token
//
//  Created by James Chen on 2016/10/05.
//  Copyright © 2016 imToken PTE. LTD. All rights reserved.
//

import Foundation

extension String {
    public var tk_isDigits: Bool {
        let regex = "^[0-9]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    public func tk_substring(from: Int) -> String {
        return String(dropFirst(from))
    }
    
    public func tk_substring(to: Int) -> String {
        return String(dropLast(count - to))
    }
    
    public func lpad(width: Int, with: String) -> String {
        let len = lengthOfBytes(using: .utf8)
        
        if len >= width {
            return self
        } else {
            return "".padding(toLength: (width - len), withPad: with, startingAt: 0) + self
        }
    }
    
    public func keccak256() -> String {
        return Encryptor.Keccak256().encrypt(data: data(using: .utf8)!)
    }
    
    public func add0xIfNeeded() -> String {
        return Hex.addPrefix(self)
    }
    
    public func removePrefix0xIfNeeded() -> String {
        return Hex.removePrefix(self)
    }
    
    public func tk_tidyMnemonic() -> String {
        return self.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
            .trimmingCharacters(in: .whitespaces)
    }
    
    public func tk_toJSON() throws -> JSONObject {
        let jsonObject: JSONObject
        do {
            let data = self.data(using: .utf8)!
            jsonObject = try JSONSerialization.jsonObject(with: data) as! JSONObject
        } catch {
            throw KeystoreError.invalid
        }
        return jsonObject
    }
}
