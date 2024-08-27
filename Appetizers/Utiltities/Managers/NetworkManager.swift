//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Prashanti Venna on 12/08/2024.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerUrl = baseUrl + "appetizers"
    
    private init() { }
    
    func getAppetizers(completion: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error  {
                completion(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completion(.success(decoderResponse.request))
            } catch {
                completion(.failure(.invalidData))
                return
            }
        }
        task.resume()
    }
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerUrl) else {
            throw APError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        do {
            let appetizerResponse = try JSONDecoder().decode(AppetizerResponse.self, from: data)
            return appetizerResponse.request
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        task.resume()
    }
}
