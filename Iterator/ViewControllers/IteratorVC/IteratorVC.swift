//
//  IteratorVC.swift
//  Iterator
//
//  Created by Shumakov Dmytro on 08.12.2022.
//

import UIKit
import Foundation

class IteratorVC: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testIteratorProtocol()
        testIteratorForExample()
    }
    
    // MARK: - Methods
    
    func testIteratorProtocol() {
        
        let words = WordsCollection()
        words.append("First")
        words.append("Second")
        words.append("Third")
        
        print("Straight traversal using IteratorProtocol:")
        Client.clientCode(sequence: words)
    }
    
    func testAnyIterator() {
        
        let numbers = NumbersCollection()
        numbers.append(1)
        numbers.append(2)
        numbers.append(3)
        
        print("\nReverse traversal using AnyIterator:")
        Client.clientCode(sequence: numbers)
    }
    
    func testIteratorForExample() {
        let tree = Tree(1)
        tree.left = Tree(2)
        tree.right = Tree(3)
        
        print("Tree traversal: Inorder")
        clientCode(iterator: tree.iterator(.inOrder))
        
        print("\nTree traversal: Preorder")
        clientCode(iterator: tree.iterator(.preOrder))
        
        print("\nTree traversal: Postorder")
        clientCode(iterator: tree.iterator(.postOrder))
    }
    
    func clientCode<T>(iterator: AnyIterator<T>) {
        while case let item? = iterator.next() {
            print(item)
        }
    }
}

