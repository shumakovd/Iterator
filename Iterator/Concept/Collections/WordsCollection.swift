//
//  WordsCollection.swift
//  Iterator
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

/// This is a collection that we're going to iterate through using an iterator
/// derived from IteratorProtocol.
class WordsCollection {

    lazy var items = [String]()

    func append(_ item: String) {
        self.items.append(item)
    }
}

extension WordsCollection: Sequence {

    func makeIterator() -> WordsIterator {
        return WordsIterator(self)
    }
}
