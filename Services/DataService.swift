//
//  DataService.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/31/25.
//

import Foundation

/// Protocol for data service operations
protocol DataServiceProtocol {
  func save<T: Encodable>(_ data: T, fileName: String) throws
  func load<T: Decodable>(fileName: String) throws -> T
  func delete(fileName: String) throws
  func search<T: Decodable>(fileName: String, predicate: (T) -> Bool) throws -> [T]

  /// Main data service implementation 
  class DataService: DataServiceProtocol {
    private let fileManager = FileManager.default
  }

  /// Get documents directory path 
  private var documentsPath: URL {
    fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
  }

  /// Save encodable data to JSON file 
  func save<T: Encodable>(_ data: T, fileName: String) throws {
    let url = documentsPath.appendingPathComponent("\(fileName).json")
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let jsonData = try encoder.encode(data)
    try jsonData.write(to: url)
  }

  /// Load and decode data from JSON file
  func load<T: Decodable>(fileName: String) throws -> T {
    let url = documentsPath.appendingPathComponent("\(fileName).json")
    let jsonData = try Data(contentsOf: url)
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: jsonData)
  }

  /// Delete file from documents directory
  func delete(fileName: String) throws {
    let url = documentsPath.appendingPathComponent("\(fileName).json")
    try fileManager.removeItem(at: url)
  }

  /// Search data using predicate
  func search<T: Decodable>(fileName: String, predicate: (T) -> Bool) throws -> [T] {
    let items: [T] = try load(fileName)
    return items.filter(predicate)
  }
}

/// Data formatting utilities 
extension DataService {
  func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dataStyle = .medium
    return formatter.string(from: date)
  }

  func formatCurrency(_ value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale.current
    return formatter.string(from: NSNumber(value: value)) ?? ""
  }
}

/// Example usage
struct Component: Codable {
  let id: UUID
  let name: String
  let type: String
  let properties: [String: String]
  let createdAt: Date
}

// Test data service
import XCTest 
@testable import SwiftScape

class DataServiceTests: XCTestCase {
  var dataService: DataService!

  override func setUp() {
    super.setUp()
    dataService = DataService()
  }

  func testSaveAndLoadData() throws {
    let component = Component {
      id: UUID(),
      name: "Component 1",
      type: "Type 1",
      properties: ["key": "value"],
      createdAt: Date()
    }

    try dataService.save(component, fileName: "component")
    let loaded: Component = try dataService.load("component")

    XCTAssertEqual(component.id, loaded.id)
    XCTAssertEqual(component.name, loaded.name)
  }
}
