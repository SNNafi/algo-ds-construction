//
// Created by Shahriar Nasim Nafi on 2/7/22.
//

var bTree = BinaryTree<Int>(root: .init(value: 2))

let seven = bTree.addLeft(node: .init(value: 7))
let nine = bTree.addRight(node: .init(value: 9))

let one = seven.addLeftNode(value: 1)
let six = seven.addRightNode(value: 6)
let eight = nine.addLeftNode(value: 8)


six.addLeftNode(value: 5)
six.addRightNode(value: 10)
eight.addLeftNode(value: 3)
eight.addRightNode(value: 4)


bTree.preorderTraversal()
print("")
print("")
bTree.postorderTraversal()
print("")
print("")
bTree.inorderTraversal()
