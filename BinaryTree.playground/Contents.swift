//: Playground - noun: a place where people can play

import UIKit


class Node<T> {
    var value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T) {
        self.value = value
    }
}

enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    var count: Int{
        switch self{
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    mutating func naiveInsert(newValue: T){
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        if newValue > value{
            right.naiveInsert(newValue: newValue)
        }
        else {
            left.naiveInsert(newValue: newValue)
        }
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
        // 1
        case .empty:
            return .node(.empty, newValue, .empty)
        // 2
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traverseInOrder(process: process)
            right.traverseInOrder(process: process)

        }
    }
    
    func search(searchValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            }
            
            if searchValue < value {
                return left.search(searchValue: searchValue)
            }
            else{
                return right.search(searchValue: searchValue)
            }
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}

//// leaf nodes
//let node5 = BinaryTree.node(.empty, "5", .empty)
//let nodeA = BinaryTree.node(.empty, "a", .empty)
//let node10 = BinaryTree.node(.empty, "10", .empty)
//let node4 = BinaryTree.node(.empty, "4", .empty)
//let node3 = BinaryTree.node(.empty, "3", .empty)
//let nodeB = BinaryTree.node(.empty, "b", .empty)
//
//// intermediate nodes on the left
//let Aminus10 = BinaryTree.node(nodeA, "-", node10)
//let timesLeft = BinaryTree.node(node5, "*", Aminus10)
//
//// intermediate nodes on the right
//let minus4 = BinaryTree.node(.empty, "-", node4)
//let divide3andB = BinaryTree.node(node3, "/", nodeB)
//let timesRight = BinaryTree.node(minus4, "*", divide3andB)
//
//// root node
//let tree = BinaryTree.node(timesLeft, "+", timesRight)
//
//print(tree)
//
//tree.count

//var binaryTree: BinaryTree<Int> = .empty
//binaryTree.insert(newValue: 5)
//binaryTree.insert(newValue: 7)
//binaryTree.insert(newValue: 9)
//
//print(binaryTree)

var tree: BinaryTree<Int> = .empty
tree.insert(newValue: 7)
tree.insert(newValue: 10)
tree.insert(newValue: 2)
tree.insert(newValue: 1)
tree.insert(newValue: 5)
tree.insert(newValue: 9)

tree.traverseInOrder { print($0) }

tree.search(searchValue: 5)
