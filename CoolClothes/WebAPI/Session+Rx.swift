//
//  Session+Rx.swift
//  CoolClothes
//
//  Created by Chatterjee, Sumeru(AWF) on 12/3/17.
//  Copyright © 2017 Chatterjee, Sumeru. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

extension Session: ReactiveCompatible {}

extension Reactive where Base: Session {
    func response<T: Request>(_ request: T) -> Single<T.Response> {
        return Single.create { [weak base] observer in
            let task = base?.send(request) { result in
                switch result {
                case let .success(response):
                    observer(.success(response))
                case let .failure(error):
                    switch error {
                    case let .connectionError(connectionError):
                        observer(.error(connectionError))
                    case let .requestError(requestError):
                        observer(.error(requestError))
                    case let .responseError(responseError):
                        observer(.error(responseError))
                    }
                }
            }
            
            return Disposables.create {
                task?.cancel()
            }
        }
    }
}

