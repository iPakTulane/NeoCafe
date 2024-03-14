//
//  NetworkService.swift
//  NetworkLayer
//
//  Created by iPak Tulane on 06/02/24.
//

import Foundation
import Moya
import Alamofire

public typealias MultiTarget = Moya.MultiTarget
public typealias TargetType = Moya.TargetType

protocol NetworkServiceProtocol: AnyObject {
    var provider: MoyaProvider<MultiTarget> { get set }
    func sendRequest<SuccessModel: Decodable>(
        successModelType: SuccessModel.Type,
        endpoint: MultiTarget,
        completion: @escaping ((Result<SuccessModel, MoyaError>) -> Void)
    )
}

class NetworkService: NetworkServiceProtocol {
    var provider: MoyaProvider<MultiTarget> = .init()
    
    func sendRequest<SuccessModel: Decodable>(
        successModelType: SuccessModel.Type,
        endpoint: MultiTarget,
        completion: @escaping ((Result<SuccessModel, MoyaError>) -> Void)
    ) {
        provider.request(endpoint) { result in
            switch result {
            case .success(let response):
                do {
                    let _ = try response.filterSuccessfulStatusCodes()
                    do {
                        if successModelType == String.self,
                           let result = String(data: response.data, encoding: .utf8),
                           let mapped = result as? SuccessModel {
                            completion(.success(mapped))
                        } else {
                            let mappedModel = try response.map(SuccessModel.self, failsOnEmptyData: false)
                            completion(.success(mappedModel))
                        }
                    } catch let modelMappingError {
                        print(endpoint, modelMappingError)
                        completion(.failure(MoyaError.encodableMapping(modelMappingError)))
                    }
                } catch let validationError as MoyaError {
                    switch validationError {
                    case .statusCode:
                        let statusCode = validationError.response?.statusCode ?? -1
                        let errorDescription = validationError.errorDescription ?? "No error description available"
                        print("Validation Error - Endpoint: \(endpoint), Status Code: \(statusCode), Error: \(errorDescription)")
                    case .underlying(let error, _):
                        if let urlError = error as? URLError, urlError.code == .badURL {
                            print("Wrong URL or path error - Endpoint: \(endpoint), URL: \(urlError.failingURL?.absoluteString ?? "N/A")")
                        }
                    default:
                        break
                    }
                    completion(.failure(validationError))
                } catch {
                    let unknownError = MoyaError.underlying(error, nil)
                    print(endpoint, unknownError)
                    completion(.failure(unknownError))
                }
            case .failure(let error):
                var errorData: String?
                if let responseData = error.response?.data,
                   let str = String(data: responseData, encoding: .utf8) {
                    errorData = str
                }
                let errorDescription = error.errorDescription ?? error.localizedDescription
                let logMessage = """
            Request failed:
            - Endpoint: \(endpoint)
            - Error: \(errorDescription)
            - Error Data: \(errorData ?? "N/A")
            """
                print(logMessage)
                completion(.failure(error))
            }
        }
    }
}
