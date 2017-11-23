//: Playground - noun: a place where people can play

import UIKit

class Node<T> {
    var value: T
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: T){
         self.value = value
    }
    
    func add(child: Node){
        children.append(child)
        child.parent = self
    }
}

extension Node: CustomStringConvertible{
    var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}

extension Node where T: Equatable {
    func search(value: T) -> Node? {
        if value == self.value{
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}








let beverages = Node(value: "beverages")

let hotBeverages = Node(value: "hot")
let coldBeerages = Node(value: "cold")

let tea = Node(value: "tea")

let black = Node(value: "black")
let green = Node(value: "green")
let chai = Node(value: "chai")

tea.add(child: black)
tea.add(child: green)
tea.add(child: chai)

let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")

hotBeverages.add(child: cocoa)
hotBeverages.add(child: tea)
hotBeverages.add(child: coffee)


beverages.add(child: hotBeverages)
beverages.add(child: coldBeerages)

print(beverages)

beverages.search(value: "cocoa") // returns the "cocoa" node
beverages.search(value: "chai") // returns the "chai" node
beverages.search(value: "bubbly") // returns nil

let number = Node(value: 5)