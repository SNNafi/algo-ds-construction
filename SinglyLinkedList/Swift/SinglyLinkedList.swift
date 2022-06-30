//
// Created by Shahriar Nasim Nafi on 1/7/22.
//

class Node<T> {
    let value: T
    var next: Node?
    
    init(value: T, next: Node?) {
        self.value = value
        self.next = next
    }
    
    static func create(value: T, next: Node?) -> Node {
        Node(value: value, next: next)
    }
}

/// Singly LinkedList
struct LinkedList<T> {
    private(set) var head: Node<T>?
    
    /// Add `Node` at the first
    /// - Parameter value:
    /// - Returns: Added `Node`
    mutating func prepend(value: T) -> Node<T> {
        let node = Node.create(value: value, next: head)
        head = node
        return node
    }
    
    /// Add `Node` at the last
    /// - Parameter value:
    /// - Returns: Added `Node`
    mutating func append(value: T) -> Node<T> {
        let node = Node.create(value: value, next: nil)
        
        if head == nil {
            head = node
            return node
        }
        
        var current = head
        
        while current?.next != nil {
            current = current?.next
        }
        
        current?.next = node
        return node
    }
    
    /// Insert `Node` after specific `Node`
    /// - Parameters:
    ///   - node: `Node` after add
    ///   - value:
    /// - Returns: Added `Node`
    mutating func insert(after node: Node<T>, value: T) -> Node<T> {
        let temp = node.next
        let created = Node.create(value: value, next: temp)
        node.next = created
        return created
    }
    
    /// Remove `Node` from list
    /// - Parameter node: `Node` to remove
    /// - Returns: If `Node` doesn't exist return `false`
    mutating func remove(node: Node<T>) -> Bool {
        if head === node {
            head = head?.next
            return true
        }
        
        var current = head
        
        while current != nil {
            if current?.next === node {
                break
            }
            
            current = current?.next
        }
    
        if current == nil {
            return false
        }
        
        current?.next = current?.next?.next
        return true
    }
    
    /// Print all `Node`(s)
    func print() {
        
        if head == nil {
            return
        }
        
        var current = head
        Swift.print("")
        Swift.print("LinkedList" , terminator: " -> ")
        while let c = current {
            Swift.print(c.value, terminator: " ")
            current = current?.next
        }
        Swift.print("")
    }
}
