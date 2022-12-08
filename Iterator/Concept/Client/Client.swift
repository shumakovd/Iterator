//
//  Client.swift
//  Iterator
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

/// Client does not know the internal representation of a given sequence.
class Client {
    // ...
    static func clientCode<S: Sequence>(sequence: S) {
        for item in sequence {
            print(item)
        }
    }
    // ...
}
