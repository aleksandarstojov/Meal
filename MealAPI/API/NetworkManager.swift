import Foundation
import UIKit

final class NetworkManager {
    
    func fetch<T:Decodable>(result: Endpoint) async throws -> T {
        do {
            var urlRequest: URLRequest
            var urlComponents = URLComponents(string: Constants.baseURL) // if there is nothing inside api.url than send me the base url
            
            let path = urlComponents?.path.appending(result.path) ?? ""
            
            urlComponents?.path = path
            
            if let queryItem = result.queryItems {
                urlComponents?.queryItems =  queryItem
            }
            guard let fullUrl = urlComponents?.url else {
                assertionFailure("Did not load the url")
                urlRequest = URLRequest(url: URL(string: "")!)
                return URLError(.cannotDecodeContentData) as! T
            }
            
            urlRequest = URLRequest(url: fullUrl)
            urlRequest.timeoutInterval = result.timeoutInterval
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let response = response as? HTTPURLResponse else { throw  URLError(.badURL) }
            
            if response.statusCode == 200 {
                
                do{
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw  URLError(.cannotDecodeContentData)
                }
            } else {
                throw URLError(.badServerResponse)
            }
        } catch {
            throw  URLError(.unsupportedURL)
        }
    }
}

// check apple book page 428 how to do query items
