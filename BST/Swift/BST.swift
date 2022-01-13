//
// Created by Shahriar Nasim Nafi on 13/1/22.
//

class BST<T: Comparable> {
    private var value: T
    private var left: BST?
    private var right: BST?

    init(value: T) {
        self.value = value
    }

    /**
     Insert new value to the `BST`
     __Average__: O(logn) time | O(1) space
     __Worst__: O(n) time | O(1) space
     */
    /// - Parameter value: value to add
    /// - Returns: Current `BST`
    func insert(_ value: T) -> BST {
        var current: BST? = self
        while current != nil {
            if current!.value > value {
                if (current!.left != nil) {
                    current = current?.left
                } else {
                    current!.left = BST(value: value)
                    break
                }
            } else {
                if (current!.right != nil) {
                    current = current?.right
                } else {
                    current!.right = BST(value: value)
                    break
                }
            }
        }

        return self
    }

    /// Check if value contains in the `BST`
    ///  __Average__: O(logn) time | O(1) space
    ///  __Worst__: O(n) time | O(1) space
    /// - Parameter value: value  to check
    /// - Returns: `true` if exists else `false`
    func contains(_ value: T) -> Bool {
        var current: BST? = self
        while current != nil {
            if (current!.value > value) {
                current = current?.left
            } else if (current!.value < value) {
                current = current?.right
            } else {
                return true
            }
        }

        return false
    }

    /// Remove specific value
    ///  __Average__: O(logn) time | O(1) space
    ///  __Worst__: O(n) time | O(1) space
    /// - Parameters:
    ///   - value: value want to remove
    ///   - parent: from the node want to remove else from current node
    /// - Returns: Current `BST`
    func remove(_ value: T, parent: BST? = nil) -> BST {
        var current: BST? = self
        var _parent: BST? = parent
        while current != nil {
            if (current!.value > value) {
                _parent = current
                current = current?.left
            } else if (current!.value < value) {
                _parent = current
                current = current?.right
            } else {
                if current!.left != nil && current!.right != nil {
                    current?.value = current!.right!.getMinValue()
                    current!.right!.remove(current!.value, parent: current)
                } else if (_parent == nil) {
                    if current!.left != nil {
                        current?.value = current!.left!.value
                        current?.right = current?.left?.right
                        current?.left = current?.left?.left
                    } else if current!.right != nil {
                        current?.value = current!.right!.value
                        current?.left = current?.right?.left
                        current?.right = current?.right?.right
                    }
                } else if _parent!.left === current! {
                    _parent?.left = current?.left != nil ? current?.left : current?.right
                } else if _parent!.right === current {
                    _parent?.right = current?.right != nil ? current?.right : current?.left
                }
                break
            }
        }
        return self
    }

    /// Remove specific value
    ///  __Average__: O(logn) time | O(1) space
    ///  __Worst__: O(n) time | O(1) space
    /// - Parameters:
    ///   - value: value want to remove
    ///   - parent: from the node want to remove else from current node
    /// - Returns: `true` if removed else `false`
    func removed(_ value: T, parent: BST? = nil) -> Bool {
        var current: BST? = self
        var _parent: BST? = parent
        while current != nil {
            if (current!.value > value) {
                _parent = current
                current = current?.left
            } else if (current!.value < value) {
                _parent = current
                current = current?.right
            } else {
                if current!.left != nil && current!.right != nil {
                    current?.value = current!.right!.getMinValue()
                    current!.right!.remove(current!.value, parent: current)
                } else if (_parent == nil) {
                    if current!.left != nil {
                        current?.value = current!.left!.value
                        current?.right = current?.left?.right
                        current?.left = current?.left?.left
                    } else if current!.right != nil {
                        current?.value = current!.right!.value
                        current?.left = current?.right?.left
                        current?.right = current?.right?.right
                    }
                } else if _parent!.left === current! {
                    _parent?.left = current?.left != nil ? current?.left : current?.right
                } else if _parent!.right === current {
                    _parent?.right = current?.right != nil ? current?.right : current?.left
                }
                return true
            }
        }
        return false
    }

    /// Get the minimum value from the node
    ///  __Average__: O(logn) time | O(1) space
    ///  __Worst__: O(n) time | O(1) space
    /// - Returns: value
    func getMinValue() -> T {
        var current: BST? = self
        while current?.left != nil {
            current = current?.left
        }
        return current!.value
    }
}