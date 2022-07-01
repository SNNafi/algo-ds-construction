//
// Created by Shahriar Nasim Nafi on 1/7/22.
//

public struct DoublyLinkedList<T> {
    
    /// Head of the Linked List
    private(set) public var head: Node<T>?
    /// Tail of the Linked List
    private(set) public var tail: Node<T>?
    /// Total `Node`(s)
    private(set) public var count: Int = 0
    
    public var isEmpty: Bool {
        count == 0
    }
    
    public init() { }
    
    /// Add `Node` to first
    ///
    /// Time & Space Complexity: 0(1)
    /// - Parameter value: value
    /// - Returns: Added `Node`
    public mutating func prepend(value: T) -> Node<T> {
        
        count+=1
        
        if head == nil {
            let node = Node(value: value, previous: nil, next: nil)
            head = node
            tail = node
            return node
        }
        
        let node = Node(value: value, previous: nil, next: head)
        head?.previous = node
        head = node;
        return node
    }
    
    ///  Add `Node` to last
    ///
    /// Time & Space Complexity: 0(1)
    /// - Parameter value: value
    /// - Returns: Added `Node`
    public mutating func append(value: T) -> Node<T> {
        
        count+=1
        
        if head == nil {
            let node = Node(value: value, previous: nil, next: nil)
            head = node
            tail = node
            return node
        }
        
        if head === tail {
            let node = Node(value: value, previous: head, next: nil)
            head?.next = node
            tail = node
            return node
        }
        
        let node = Node(value: value, previous: tail, next: nil)
        tail?.next = node
        tail = node
        return node
    }
    
    
    /// Insert `Node` after specific `Node`
    ///
    /// Time & Space Complexity: 0(1)
    /// - Parameters:
    ///   - after: `Node` after add
    ///   - value: value
    /// - Returns: Added `Node`
    public mutating func insert(after: Node<T>, value: T) -> Node<T> {
        
        count+=1
        
        let temp = after.next
        let node = Node(value: value, previous: after, next: temp)
        temp?.previous = node
        after.next = node
        return node
    }
    
    /// Remove specific `Node`
    ///
    /// Time & Space Complexity: 0(1)
    /// - Parameter node: `Node` to remove
    /// - Returns: the value of the removed `Node`
    public mutating func remove(node: Node<T>) -> T {
        
        count-=1
        
        if node === head {
            head = head?.next
            head?.previous = nil
            return node.value
        }
        
        if node === tail {
            tail = tail?.previous
            tail?.next = nil
            return node.value
        }
        
        let previous = node.previous
        let next = node.next
        previous?.next = next
        next?.previous = previous
        
        return node.value
    }
    
    /// Remove first `Node` if exist
    /// - Returns: the value of the removed `Node` if exist
    public mutating func removeFirst() -> T? {
        if let head = head {
            return remove(node: head)
        }
        return nil
    }
    
    /// Remove last `Node` if exist
    /// - Returns: the value of the removed `Node` if exist
    public mutating func removeLast() -> T? {
        if let tail = tail {
            return remove(node: tail)
        }
        return nil
    }
    
    /// Prints all `Node`(s)
    public func print() {
        if head == nil {
            return
        }
        
        var current = head
        Swift.print("")
        Swift.print("DoublyLinkedList" , terminator: " -> ")
        while let c = current {
            Swift.print(c.value, terminator: " ")
            current = current?.next
        }
        Swift.print("")
    }
    
    
    
    /// DoublyLinkedList.__Node__
    public class Node<T> {
        let value: T
        /// Previous `Node`
        var previous: Node<T>?
        /// Next `Node`
        var next: Node<T>?
        
        /// Create new `Node`. Use `internal` modifier, so that `Node` can only be created using `DoublyLinkedList` methods
        /// - Parameters:
        ///   - value: value
        ///   - previous: Previous `Node`
        ///   - next: Next `Node`
        internal init(value: T, previous: Node<T>?, next: Node<T>?) {
            self.value = value
            self.previous = previous
            self.next = next
        }
    }
   
}

public struct DoublyLinkedListIterator<T>: IteratorProtocol {
    
    let dlinked: DoublyLinkedList<T>
    var current: DoublyLinkedList<T>.Node<T>?
    
    init(dlinked: DoublyLinkedList<T>) {
        self.dlinked = dlinked
        current = dlinked.head
    }
    
    public mutating func next() -> T? {
        var value: T? = nil
        if current != nil {
            value = current?.value
            current = current?.next
        }
        return value
    }
}

extension DoublyLinkedList: Sequence {
    public func makeIterator() -> DoublyLinkedListIterator<T> {
        DoublyLinkedListIterator(dlinked: self)
    }
}
