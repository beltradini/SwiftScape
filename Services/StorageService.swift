//
//  StorageService.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/31/25.
//

import Foundation
import CloudKit

/// Protocol for storage service operations
protocol StorageService {
  func save<T: Encodable>(_ data: T, fileName: String) throws
  func load<T: Decodable>(fileName: String) throws -> T
  func delete(fileName: String) throws
  func search<T: Decodable>(fileName: String, predicate: (T) -> Bool) throws -> [T]
}

/// Main storage service implementation
final class iCloudStorageService: StorageService {
  private let container = CKContainer.default()
  private let privateDB = CKContainer.default().privateCloudDatabase

  func save<T: Encodable>(_ data: T, to fileName: String) throws {
    let record = CKRecord(recordType: "SwiftScapeData")
    let encoder = JSONEncoder()
    let encodedData = try encoder.encode(data)
    record.["filename"] = fileName as CKRecordValue
    record.["content"] = encodedData as CKRecordValue

    privateDB.save(record) { _, error in 
    if let error = error {
      print("Error saving record: \(error)")
      }
    }
  }

  func load<T: Decodable>(from fileName: String) throws -> T {
    let query = CKQuery(recordType: "SwiftScapeData", predicate: NSPredicate(format: "filename == %@", fileName))
    var resultData: Data?
    let group = DispatchGroup()
    group.enter()

    privateDB.perform(query, inZoneWith: nil) { records, _ in 
      defer { group.leave() }
      if let record = records?.first, let content = record["content"] as? Data {
        resultData = content
      }
    }

    group.wait()
    guard let data = resultData else { throw NSError(domain: "NoData", code: 404) }
    return try JSONDecoder().decode(T.self, from: data)
  }
}

func createSubscription() {
  let subscription = CKQuerySubscription(
    recordType: "SwiftScapeData",
    predicate: NSPredicate(value: true),
    options: [.firesOnRecordCreation, .firesOnRecordUpdate, .firesOnRecordDeletion]
  )

  let info = CKSubscription.NotificationInfo()
  info.shouldSendContentAvailable = true // Silent push notification

  subscript.notificationInfo = info
  privateDB.save(subscription) { _, error in 
    if let error = error {
      print("Error saving subscription: \(error)")
    }
  }
}