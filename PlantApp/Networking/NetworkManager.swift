//
//  NetworkManage.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

class NetworkManager {
    private let baseURL = "https://p6ib01la4m.execute-api.us-west-2.amazonaws.com/prod/"
    
    func getCollection<Model: Codable>(endpoint: String) async -> [Model] {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            print("bad URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(CollectionResponse<Model>.self, from: data)
            return response.items
        } catch {
            print("service error: \(error)")
            return []
        }
    }
    
    func get<Model: Codable>(endpoint: String) async -> Model? {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            print("bad URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(Response<Model>.self, from: data)
            return response.item
            
        } catch {
            print("service error: \(error)")
            return nil
        }
    }
}
