//
//  main.swift
//  LeetCodeSolutions
//
//  Created by Li, Haoxin on 8/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

//import Foundation
//
//// NOTE: add the corresponding "Challenge_XXXX.swift" file to the target membership.
//
//print("[\(Challenge.name)] begins")
//Challenge.run()
//print("[\(Challenge.name)] ends")
import Foundation

let dict = [
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine",
    10: "Ten",
    11: "Eleven",
    12: "Twelve",
    13: "Thirteen",
    14: "Fourteen",
    15: "Fifteen",
    16: "Sixteen",
    17: "Seventeen",
    18: "Eighteen",
    19: "Nineteen",
    20: "Twenty",
    30: "Thirty",
    40: "Fourty",
    50: "Fifty",
    60: "Sixty",
    70: "Seventy",
    80: "Eighty",
    90: "Ninty",
    100: "Hundred", // warning: suffix, not number
    1000: "Thousand", // warning: suffix, not number
    1000000: "Million", // warning: suffix, not number
    1000000000: "Billion" // warning: suffix, not number
]

enum Scale: Int {
    case none = 0
    case thousand = 1000
    case million = 1000000
    case billion = 1000000000
    
    var name: String? {
        switch self {
        case .none:
            return nil
        case .thousand, .million, .billion:
            return lookupStringValue(for: self.rawValue)
        }
    }
}

func lookupStringValue(for number: Int) -> String? {
    return dict[number]
}

func convertNumberToString(_ number: Int) -> String {
    guard 0 <= number else {
        fatalError("\(#function) accepts non-negative number only")
    }
    guard 0 != number else {
        return "Zero"
    }
    
    var components: [(multiplier: Int, scale: Scale)] = []
    var n = number
    
    for scale in [.billion, .million, .thousand] as [Scale] {
        let multiplier = n / scale.rawValue
        if multiplier > 0 {
            components.append((multiplier, scale))
        }
        n %= scale.rawValue
    }
    if n > 0 { // do not introduce "Zero" - it's guarded already
        components.append((n, Scale.none))
    }
    return components.map {
        let numberString = oneToOneThousandNumberString(forNumber: $0.multiplier)
        if let suffix = $0.scale.name {
            return "\(numberString) \(suffix)"
        } else {
            return numberString
        }
        }.joined(separator: " ")
}

// helper
func oneToOneThousandNumberString(forNumber number: Int) -> String {
    guard 0 < number, number < 1000 else {
        fatalError("\(#function) [\(number)] is out of range of 0..<100")
    }
    var n = number
    var result: [String] = []
    
    let hundreds = n / 100
    if hundreds > 0 {
        guard let numberString = lookupStringValue(for: hundreds), let hundredSuffix = lookupStringValue(for: 100) else {
            fatalError("\(#function) the Hundred word is not found")
        }
        result.append("\(numberString) \(hundredSuffix)")
    }
    n = n % 100 // n is less than 100 now
    
    if n > 0 {
        if let numberString = lookupStringValue(for: n) {
            result.append(numberString)
        } else {
            let lastDigit = n % 10
            if lastDigit == 0 {
                guard let tensString = lookupStringValue(for: n) else {
                    fatalError("\(#function) missing value for \(n) in lookup table")
                }
                result.append(tensString)
            } else {
                guard let tensString = lookupStringValue(for: n - lastDigit) else {
                    fatalError("\(#function) missing value for \(n - lastDigit) in lookup table")
                }
                guard let lastDigitString = lookupStringValue(for: lastDigit) else {
                    fatalError("\(#function) missing value for \(lastDigit) in lookup table")
                }
                result.append("\(tensString) \(lastDigitString)")
            }
        }
    }
    
    return result.joined(separator: " ")
}

func validate(_ input: Int, withExpectation stringOutput: String) {
    let actualOutput = convertNumberToString(input)
    if actualOutput == stringOutput {
        print("✅ - \(input) = [\(actualOutput)]")
    } else {
        print("❌ - \(input) = [\(actualOutput)] does not match [\(stringOutput)]")
    }
}


validate(0, withExpectation: "Zero")
validate(1, withExpectation: "One")
validate(12, withExpectation: "Twelve")
validate(123, withExpectation: "One Hundred Twenty Three")
validate(1234, withExpectation: "One Thousand Two Hundred Thirty Four")
validate(12345, withExpectation: "Twelve Thousand Three Hundred Fourty Five")
validate(123456, withExpectation: "One Hundred Twenty Three Thousand Four Hundred Fifty Six")
validate(1234567, withExpectation: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven")
validate(12345678, withExpectation: "Twelve Million Three Hundred Fourty Five Thousand Six Hundred Seventy Eight")
validate(123456789, withExpectation: "One Hundred Twenty Three Million Four Hundred Fifty Six Thousand Seven Hundred Eighty Nine")
validate(1234567890, withExpectation: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninty")

validate(11, withExpectation: "Eleven")
validate(111, withExpectation: "One Hundred Eleven")
validate(1111, withExpectation: "One Thousand One Hundred Eleven")
validate(11111, withExpectation: "Eleven Thousand One Hundred Eleven")
validate(111111, withExpectation: "One Hundred Eleven Thousand One Hundred Eleven")
validate(1111111, withExpectation: "One Million One Hundred Eleven Thousand One Hundred Eleven")
validate(11111111, withExpectation: "Eleven Million One Hundred Eleven Thousand One Hundred Eleven")
validate(111111111, withExpectation: "One Hundred Eleven Million One Hundred Eleven Thousand One Hundred Eleven")
validate(1111111111, withExpectation: "One Billion One Hundred Eleven Million One Hundred Eleven Thousand One Hundred Eleven")
validate(11111111111, withExpectation: "Eleven Billion One Hundred Eleven Million One Hundred Eleven Thousand One Hundred Eleven")

validate(9, withExpectation: "Nine")
validate(99, withExpectation: "Ninty Nine")
validate(999, withExpectation: "Nine Hundred Ninty Nine")
validate(9999, withExpectation: "Nine Thousand Nine Hundred Ninty Nine")
validate(99999, withExpectation: "Ninty Nine Thousand Nine Hundred Ninty Nine")
validate(999999, withExpectation: "Nine Hundred Ninty Nine Thousand Nine Hundred Ninty Nine")
validate(9999999, withExpectation: "Nine Million Nine Hundred Ninty Nine Thousand Nine Hundred Ninty Nine")
validate(99999999, withExpectation: "Ninty Nine Million Nine Hundred Ninty Nine Thousand Nine Hundred Ninty Nine")
validate(999999999, withExpectation: "Nine Hundred Ninty Nine Million Nine Hundred Ninty Nine Thousand Nine Hundred Ninty Nine")
validate(9999999999, withExpectation: "Nine Billion Nine Hundred Ninty Nine Million Nine Hundred Ninty Nine Thousand Nine Hundred Ninty Nine")


validate(67, withExpectation: "Sixty Seven")
validate(107, withExpectation: "One Hundred Seven")
validate(10203040506, withExpectation: "Ten Billion Two Hundred Three Million Fourty Thousand Five Hundred Six")
validate(102030405060, withExpectation: "One Hundred Two Billion Thirty Million Four Hundred Five Thousand Sixty")
