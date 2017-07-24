//
//  SwiftReflectionTests.swift
//  SwiftReflectionTests
//
//  Created by Cyon Alexander (Ext. Netlight) on 01/09/16.
//  Copyright © 2016 com.cyon. All rights reserved.
//

import XCTest
import Foundation
import SwiftReflection


/// Enabling comparision of "primitive data types" such as Bool, Int etc
func ==(rhs: Any, lhs: Any) -> Bool {
    let rhsType: String = "\(rhs)"
    let lhsType: String = "\(lhs)"
    let same = rhsType == lhsType
    return same
}

func ==(rhs: NSObject.Type, lhs: Any) -> Bool {
    let rhsType: String = "\(rhs)"
    let lhsType: String = "\(lhs)"
    let same = rhsType == lhsType
    return same
}

func ==(rhs: Any, lhs: NSObject.Type) -> Bool {
    let rhsType: String = "\(rhs)"
    let lhsType: String = "\(lhs)"
    let same = rhsType == lhsType
    return same
}

class SwiftReflectionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBookClass() {
        guard let types = SwiftReflection.getTypesOfProperties(in: Book.self) else {
            assert(false, "Should be able to get types")
            return
        }
        assert(types.count == 5, "Book should have 5 properties")
        for (propertyName, propertyType) in types {
            switch propertyName {
            case "title":
                assert(propertyType == NSString.self, "'title' should be of type 'String'")
            case "author":
                assert(propertyType == NSString.self, "Even though 'author' has type Optional<String> it should be 'String'")
            case "numberOfPages":
                assert(propertyType == Int.self, "'numberOfPages' should be of primitive data type 'Int'")
            case "released":
                assert(propertyType == NSDate.self, "'released' should be of type 'NSDate'")
            case "isPocket":
                assert(propertyType == Bool.self, "'isPocket' should be of primitive data type 'Bool'")
            default:
                assert(false, "should not contain any property with any other name")
            }
        }
    }

}
