//
//  DataService.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/31/25.
//

import Foundation

// MARK: - Protocol

protocol DataServiceProtocol {
    func save<T: Encodable>(_ data: T, fileName: String) throws
    func load<T: Decodable>(fileName: String) throws -> T
    func delete(fileName: String) throws
    func search<T: Decodable>(fileName: String, predicate: (T) -> Bool) throws -> [T]
}

// MARK: - Implementation

class DataService: DataServiceProtocol {
    private let fileManager = FileManager.default

    private var documentsPath: URL {
        fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    func save<T: Encodable>(_ data: T, fileName: String) throws {
        let url = documentsPath.appendingPathComponent("\(fileName).json")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let jsonData = try encoder.encode(data)
        try jsonData.write(to: url)
    }

    func load<T: Decodable>(fileName: String) throws -> T {
        let url = documentsPath.appendingPathComponent("\(fileName).json")
        let jsonData = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: jsonData)
    }

    func delete(fileName: String) throws {
        let url = documentsPath.appendingPathComponent("\(fileName).json")
        try fileManager.removeItem(at: url)
    }

    func search<T: Decodable>(fileName: String, predicate: (T) -> Bool) throws -> [T] {
        let items: [T] = try load(fileName)
        return items.filter(predicate)
    }
}

// MARK: - Utilities

extension DataService {
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
}

// MARK: - Model

struct Component: Codable {
    let id: UUID
    let name: String
    let type: String
    let properties: [String: String]
    let createdAt: Date
}
