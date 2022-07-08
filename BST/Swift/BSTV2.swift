//
// Created by Shahriar Nasim Nafi on 8/7/22.
//

struct BST<T: Comparable> {
    
    private(set) var root: Node?
    
    mutating func insert(value: T) -> Node {
        let node = Node(value: value)
        
        if root == nil {
            root = node
            return node
        }
        
        var current = root
        var parent = current
        
        while current != nil {
            parent = current
            if current!.value > value {
                current = current?.left
            } else {
                current = current?.right
            }
        }
        
        if parent!.value > value {
            parent?.addLeft(node: node)
        } else {
            parent?.addRight(node: node)
        }
        
        
        return node
    }
    
    func succesor(for node: Node) -> Node? {
        var current = node.right
        
        while(current?.left != nil) {
            current = current?.left
        }
        
        return current
    }
    
    mutating func transplant(node: Node, new: Node?) -> Node {
        if root === node {
            root = new
            return root!
        }
        
        if node.parent?.left === node {
            node.parent?.addLeft(node: new)
        } else if node.parent?.right === node {
            node.parent?.addRight(node: new)
        }
        
        return root!
        
    }
    
    mutating func remove(node: Node) {
       
        if let right = node.right, node.left == nil {
            transplant(node: node, new: right)
        } else if let left = node.left, node.right == nil {
            transplant(node: node, new: left)
        } else {
            if let smallest = succesor(for: node) {
                if smallest.parent !== node {
                    root = transplant(node: smallest, new: smallest.right)
                    smallest.addRight(node: node.right)
                }
                
                root = transplant(node: node, new: smallest)
                smallest.addLeft(node: node.left)
            }
        }
    }
    
    class Node {
        let value: T
        var parent: Node?
        var left: Node?
        var right: Node?
        
        init(value: T) {
            self.value = value
        }
        
        func addLeft(value: T) -> Node {
            let node = Node(value: value)
            node.parent = self
            self.left = node
            return node
        }
        
        func addRight(value: T) -> Node {
            let node = Node(value: value)
            node.parent = self
            self.right = node
            return node
        }
        
        func addLeft(node: Node?) -> Node? {
            node?.parent = self
            self.left = node
            return node
        }
        
        func addRight(node: Node?) -> Node? {
            node?.parent = self
            self.right = node
            return node
        }
    }
}
