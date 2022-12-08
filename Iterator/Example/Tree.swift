//
//  Tree.swift
//  Iterator
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import Foundation

class Tree<T> {

    var value: T
    var left: Tree<T>?
    var right: Tree<T>?

    init(_ value: T) {
        self.value = value
    }

    typealias Block = (T) -> ()

    enum IterationType {
        case inOrder
        case preOrder
        case postOrder
    }

    func iterator(_ type: IterationType) -> AnyIterator<T> {
        var items = [T]()
        switch type {
        case .inOrder:
            inOrder { items.append($0) }
        case .preOrder:
            preOrder { items.append($0) }
        case .postOrder:
            postOrder { items.append($0) }
        }

        /// Note:
        /// AnyIterator is used to hide the type signature of an internal
        /// iterator.
        return AnyIterator(items.makeIterator())
    }

    private func inOrder(_ body: Block) {
        left?.inOrder(body)
        body(value)
        right?.inOrder(body)
    }

    private func preOrder(_ body: Block) {
        body(value)
        left?.inOrder(body)
        right?.inOrder(body)
    }

    private func postOrder(_ body: Block) {
        left?.inOrder(body)
        right?.inOrder(body)
        body(value)
    }
}
