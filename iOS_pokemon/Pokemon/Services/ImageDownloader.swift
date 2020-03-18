//
//  ImageDownloader.swift
//  Pokemon
//
//  Created by Claire on 17/04/2019.
//  Copyright © 2019 Claire. All rights reserved.
//

import Foundation
import UIKit

// MARK: this enum is available with Swift 5
enum Result<Value> {
    case success(Value)
    case failure(Error)

    var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

struct ImageDownloader {
    static func download(imageURLString: String, completion: @escaping (Result<UIImage>) -> Void) {
        guard let imageURL = URL(string: imageURLString) else {
            completion(.failure(APIError.badUrl))
            return
        }
        DispatchQueue.global().async {
            let session = URLSession.shared.dataTask(with: imageURL) { data, _, _ in
                guard let data = data,
                let image = UIImage(data: data) else {
                    DispatchQueue.main.async {
                        completion(.failure(APIError.noImageFound))
                    }
                    return
                }

                DispatchQueue.main.async {
                    completion(.success(image))
                }
            }

            session.resume()
        }
    }
}
