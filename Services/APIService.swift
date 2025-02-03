//
//  APIService.swift
//  SwiftScape
//
//  Created by Alejandro Beltrán on 1/31/25.
//

import SwiftUI

enum APIError: Error {
  case invalidURL
  case requestFailed
  case decodingError
  case unauthorized
}

struct APIService {
  private let session: URLSession
  private let baseURL: String

  init(baseURL: String,
        session: URLSession = .shared) {
    self.baseURL = baseURL
    self.session = session
    }
  
  /// Realiza una petición GET y devuelve un objeto decodificado
  func fetchData<T: Decodable>(_ endpoint: String, 
                              token: String? = nil,
                              completion: @escaping (Result<T, APIError>) -> Void) {
      guard let url = URL(string: baseURL + endpoint) else {
        completion(.failure(.invalidURL))
        return                        
      }

      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      if let token = token {
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
      }

      session.dataTask(with: request) { data, response, error in 
        if let _ = error {
          completion(.failure(.requestFailed))
          return
        }
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
          completion(.failure(.unauthorized))
          return
        }
        if httpResponse.statusCode == 204 {
          completion(.failure(.decodingError))
          return
        }

        guard let data = data else {
          completion(.failure(.decodingError))
          return
        }
        do {
          let decodedData = try JSONDecoder().decode(T.self, from: data)
          completion(.success(decodedData))
        } catch {
          completion(.failure(.decodingError))
        }
      }.resume()
  } 
}