//: Playground - noun: a place where people can play

import UIKit

struct Stack<T> {
    fileprivate var array: [T] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: T){
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    func peek() -> T? {
        return array.last
    }
}

extension Stack: CustomStringConvertible{
    var description:String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        let stackElements = array.map { "\($0)" }.reversed().joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

// 1
var rwBookStack = Stack<Any>()

// 2
rwBookStack.push("3D Games by Tutorials")
// 3
rwBookStack.peek()

print(rwBookStack)

// 4
rwBookStack.pop()
// 5
rwBookStack.pop()