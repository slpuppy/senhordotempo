

import Foundation

extension URLSession {
    
    func dataTask<T>(_ forType: T.Type, endpoint: ApiEndpoint, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask where T: Decodable {
        dataTask(endpoint: endpoint) {  result in
            switch result {
            case .success(let data):
                let parsed = self.parseResponse(forType, using: data)
                completion(parsed)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func parseResponse<T>(_ forType: T.Type, using data: Data) -> Result<T, Error> where T: Decodable {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(error)
        }
    }
    
    func dataTask(endpoint: ApiEndpoint, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        let request = endpoint.request
        return dataTask(with: request) { [validateRequest] data, response, error in
            do {
                let result = try validateRequest(data, response, error)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func validateRequest(_ data: Data?, _ response: URLResponse?, error: Error?) throws -> Data {
        if let error = error {
            throw error
        }
        
        guard let response = response as? HTTPURLResponse else {
            throw fatalError()
        }
        
        print("RESPOSTA DO STATUS QUOETE\(response.statusCode)")
        
        switch response.statusCode {
        case 200...300:
            return data ?? .init()
        default:
            throw fatalError()
        }
        
    }
}
