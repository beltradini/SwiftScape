//
//  SwiftScapeTests.swift
//  SwiftScapeTests
//
//  Created by Alejandro Beltrán on 4/13/25.
//

import Testing

struct SwiftScapeTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

}

import XCTest
@testable import SwiftScape

class DataServiceTests: XCTestCase {
    var dataService: DataService!

    override func setUp() {
        super.setUp()
        dataService = DataService()
    }

    func testSaveAndLoadData() throws {
        let component = Component(
            id: UUID(),
            name: "Component 1",
            type: "Type 1",
            properties: ["key": "value"],
            createdAt: Date()
        )

        try dataService.save(component, fileName: "component")
        let loaded: Component = try dataService.load(fileName: "component")

        XCTAssertEqual(component.id, loaded.id)
        XCTAssertEqual(component.name, loaded.name)
    }
}
