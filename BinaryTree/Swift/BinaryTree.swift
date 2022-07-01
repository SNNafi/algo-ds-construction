//
// Created by Shahriar Nasim Nafi on 2/7/22.
//

struct BinaryTree<T> {
    
    private let root: Node<T>
    
    init(root: Node<T>) {
        self.root = root
    }
    
    func addLeft(node: Node<T>) -> Node<T> {
        root.addLeft(node: node)
    }
    
    func addRight(node: Node<T>) -> Node<T> {
        root.addRight(node: node)
    }
    
    func addLeftNode(value: T) -> Node<T> {
        root.addLeftNode(value: value)
    }
    
    func addRightNode(value: T) -> Node<T> {
        root.addRightNode(value: value)
    }
    
    func preorderTraversal() {
        root.preorderTraversal()
    }
    
    func postorderTraversal() {
        root.postorderTraversal()
    }
    
    func inorderTraversal(rootValue: T? = nil) {
        root.inorderTraversal()
    }
    
    class Node<T> {
        let value: T
        private(set) var left: Node<T>?
        private(set) var right: Node<T>?
        
        init(value: T) {
            self.value = value
        }
        
        func addLeft(node: Node<T>) -> Node<T> {
            left = node
            return node
        }
        
        func addRight(node: Node<T>) -> Node<T> {
            right = node
            return node
        }
        
        func addLeftNode(value: T) -> Node<T> {
            left = .init(value: value)
            return left!
        }
        
        func addRightNode(value: T) -> Node<T> {
            right = .init(value: value)
            return right!
        }
        
        func preorderTraversal(rootValue: T? = nil) {
           
            if let rootValue = rootValue {
                print(rootValue, "->", value)
            } else {
                print(value)
            }
            
            left?.preorderTraversal(rootValue: value)
            right?.preorderTraversal(rootValue: value)
        }
        
        func postorderTraversal(rootValue: T? = nil) {
            left?.postorderTraversal(rootValue: value)
            right?.postorderTraversal(rootValue: value)
           
            if let rootValue = rootValue {
                print(rootValue, "->", value)
            } else {
                print(value)
            }
        }
        
        func inorderTraversal(rootValue: T? = nil) {
            left?.inorderTraversal(rootValue: value)
            
            if let rootValue = rootValue {
                print(rootValue, "->", value)
            } else {
                print(value)
            }
            
            right?.inorderTraversal(rootValue: value)
        }
        
    }
}
