//
//  NumbersCollection.swift
//  Iterator
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

/// This is another collection that we'll provide AnyIterator for traversing its
/// items.
class NumbersCollection {

    lazy var items = [Int]()

    func append(_ item: Int) {
        self.items.append(item)
    }
}

extension NumbersCollection: Sequence {

    func makeIterator() -> AnyIterator<Int> {
        var index = self.items.count - 1

        return AnyIterator {
            defer { index -= 1 }
            return index >= 0 ? self.items[index] : nil
        }
    }
}
