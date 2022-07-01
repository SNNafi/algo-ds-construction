//
// Created by Shahriar Nasim Nafi on 2/7/22.
//

#include <iostream>

using namespace std;


Node *createTree() {
    Node *root = Node::create(2);

    Node *seven = Node::create(7);
    Node *nine = Node::create(9);

    root->addLeft(seven);
    root->addRight(nine);

    Node *one = Node::create(1);
    Node *six = Node::create(6);
    Node *eight = Node::create(8);

    seven->addLeft(one);
    seven->addRight(six);
    nine->addLeft(eight);

    Node *five = Node::create(5);
    Node *ten = Node::create(10);
    Node *three = Node::create(3);
    Node *four = Node::create(4);

    six->addLeft(five);
    six->addRight(ten);
    eight->addLeft(three);
    eight->addRight(four);

    return root;

}

int main() {
    Node *root = createTree();
    preOrderTraversal(root, root->value);
    cout << endl;
    cout << endl;
    postOrderTraversal(root, root->value);
    cout << endl;
    cout << endl;
    inOrderTraversal(root, root->value);
}