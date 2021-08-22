//
//  BinarySearchTreeTest.swift
//  BinarySearchTreeTest
//
//  Created by Илья Ковальчук on 15.08.2021.
//

import XCTest

class BinarySearchTreeTest: XCTestCase {
    
    func testSearch() {
        let bst = BSTNode(nodes: [0, 2, -4, 2])
        print(bst.search(value: 2))
        print(bst.search(value: -1))
    }
    
    func testRemove() {
        var bst: BSTNode? = BSTNode(nodes: [0, 2, -4, 2, 10])
        print(bst)
        bst = bst?.remove()
        print(bst)
        bst = bst?.remove()
        print(bst)
    }
    
    func testLmr() {
        let bst = BSTNode(nodes: [0, 2, -4, 2, 10])
        var result: [Int] = []
        bst.lmr { result.append($0) }
        XCTAssertEqual(result, [-4, 0, 2, 2, 10])
    }
    
    func testRml() {
        let bst = BSTNode(nodes: [0, 2, -4, 2, 10])
        var result: [Int] = []
        bst.rml { result.append($0) }
        XCTAssertEqual(result, [10, 2, 2, 0, -4])
    }
    
    func testMap() {
        let bst = BSTNode(nodes: [0, 2, -4, 2, 10])
        let result = bst.map { $0 }
        XCTAssertEqual(result, [-4, 0, 2, 2, 10])
    }
    
    func testToArrayAsc() {
        let bst = BSTNode(nodes: [0, 2, -4, 2, 10])
        XCTAssertEqual(bst.toArrayAsc(), [-4, 0, 2, 2, 10])
    }
    
    func testToArrayDesc() {
        let bst = BSTNode(nodes: [0, 2, -4, 2, 10])
        XCTAssertEqual(bst.toArrayDesc(), [10, 2, 2, 0, -4])
    }
}

