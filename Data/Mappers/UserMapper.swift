//
//  UserMapper.swift
//  Data
//
//  Created by Marcelo Antunes on 10/08/2020.
//  Copyright © 2020 Marcelo Antunes. All rights reserved.
//

import Foundation
import Domain
import JSPlatform

extension Domain.User: JSRepresentable {
    func asJS() -> JSPlatform.JSUser {
        JSUser(id: id, name: name)
    }
}

extension JSPlatform.JSUser: DomainConvertibleType {
    func asDomain() -> Domain.User {
        return Domain.User(id: id, name: name)
    }
}
