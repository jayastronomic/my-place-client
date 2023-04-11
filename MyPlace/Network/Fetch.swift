//
//  Fetch.swift
//  MyPlace
//
//  Created by Julian Smith on 3/21/23.
//

import Foundation



enum Method: String {
  case GET, POST, PATCH, DELETE
}

struct GenericResponse: Codable {
  var message: String
  var status: String
}

let backend = "http://localhost:8080"

func deleteResource(){
  let url = URL(string: backend + "/logout")!
  var request = URLRequest(url: url)
  request.httpMethod = Method.DELETE.rawValue
  URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
      print("Error deleting item: \(error.localizedDescription)")
      return
    }
    
    guard let httpResponse = response as? HTTPURLResponse else {
      print("Invalid response")
      return
    }
    
    if !(200...299).contains(httpResponse.statusCode) {
    print("Error deleting item: HTTP status code \(httpResponse.statusCode)")
    return
    }
    
    guard let data = data else {
      print("No data returned")
      return
    }

    print(data)
    
    // Item was deleted successfully
    print("Item was deleted successfully")
    
  }.resume()
}

func fetch<Struct: Codable, Payload: Codable>(_ path: String, method: Method, headers: [String: String]? = nil, type: Struct.Type? = nil, payload: Payload? = nil ) async throws -> Struct? {
  do {
    let url = URL(string: backend + path)!
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    
    if headers != nil {
      for(key, value) in headers! {
        request.addValue(value, forHTTPHeaderField: key)
      }
    }
    
    if method == .GET {
      async let (data, _) = URLSession.shared.data(from: url)
      let response = try await JSONDecoder().decode(type.self!, from: data)
      return response
    }
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    guard let encoded = try? JSONEncoder().encode(payload) else {
        return nil
    }
    let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
    let decoded = try JSONDecoder().decode(type.self!, from: data)
    print(decoded)
    return decoded
  } catch {
    print("Error: \(error)")
  }
  return nil
}

