//: Playground - noun: a place where people can play

import UIKit

public class Node<T> {
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T){
        self.value = value
    }
}

public class LinkedList<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>?{
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
        else{
            head = newNode
        }
        
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0{
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 { return node }
                node = node?.next
                i -= 1
            }
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> String {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next // 1
        } else {
            head = next // 2
        }
        next?.previous = prev // 3
        
        if next == nil {
            tail = prev // 4
        }
        
        // 5
        node.previous = nil 
        node.next = nil
        
        // 6
        return node.value as! String
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }

        return text + "]"
    }
}

let dogBreeds = LinkedList<Any>()
dogBreeds.append(value: "Labrador")
dogBreeds.append(value: "Bulldog")
dogBreeds.append(value: "Beagle")
dogBreeds.append(value: "Husky")

print(dogBreeds)
dogBreeds.remove(node: dogBreeds.nodeAt(index: 2)!)
print(dogBreeds)

let numbers = LinkedList<Int>()
numbers.append(value: 5)
numbers.append(value: 10)
numbers.append(value: 15)

print(numbers)