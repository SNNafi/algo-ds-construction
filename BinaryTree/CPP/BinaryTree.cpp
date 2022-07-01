//
// Created by Shahriar Nasim Nafi on 2/7/22.
//

#include <iostream>

using namespace std;

struct Node {
    int value;
    Node *left;
    Node *right;

    static Node *create(int value, Node *left = nullptr, Node *right = nullptr) {
        Node *node = new Node();
        node->value = value;
        node->left = left;
        node->right = right;
        return node;
    }

    void addLeft(Node *node) {
        this->left = node;
    }

    void addRight(Node *node) {
        this->right = node;
    }
};

void preOrderTraversal(Node *node, int rootValue) {
    if (!node) {
        return;
    }
    if (rootValue == node->value) {
        cout << node->value << endl;
    } else {
        cout << rootValue << " -> " << node->value << endl;
    }

    preOrderTraversal(node->left, node->value);
    preOrderTraversal(node->right, node->value);

}

void postOrderTraversal(Node *node, int rootValue) {
    if (!node) {
        return;
    }

    postOrderTraversal(node->left, node->value);
    postOrderTraversal(node->right, node->value);

    if (rootValue == node->value) {
        cout << node->value << endl;
    } else {
        cout << rootValue << " -> " << node->value << endl;
    }
}

void inOrderTraversal(Node *node, int rootValue) {
    if (!node) {
        return;
    }

    inOrderTraversal(node->left, node->value);
    if (rootValue == node->value) {
        cout << node->value << endl;
    } else {
        cout << rootValue << " -> " << node->value << endl;
    }
    inOrderTraversal(node->right, node->value);

}