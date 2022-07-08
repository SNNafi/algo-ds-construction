//
// Created by Shahriar Nasim Nafi on 8/7/22.
//

#include <iostream>

using namespace std;

struct Node {
    int value;
    Node *parent;
    Node *left;
    Node *right;

    void addLeft(Node *node) {
        node->parent = this;
        this->left = node;
    }

    void addRight(Node *node) {
        node->parent = this;
        this->right = node;
    }
};

struct BST {
public:
    Node *root = nullptr;

    Node *insert(int value) {
        Node *node = new Node();
        node->value = value;

        if (!root) {
            root = node;
            return node;
        }

        Node *parent = nullptr;
        Node *current = root;

        while (current) {
            parent = current;
            if (node->value > current->value) {
                current = current->right;
            } else {
                current = current->left;
            }
        }

        if (node->value > parent->value) {
            parent->addRight(node);
        } else {
            parent->addLeft(node);
        }

        return node;
    }

    Node *transplant(Node *current, Node *node) {
        if (root == current) {
            root = current;
            return root;
        }

        if (current->parent->left == current) {
            current->parent->addLeft(node);
        } else {
            current->parent->addRight(node);
        }
        return root;
    }

    Node *succesorNode(Node *node) {
        Node *current = node->right;

        Node *smallestNode;

        while (current->left) {
            current = current->left;
        }

        smallestNode = current;
        return smallestNode;
    }

    Node *deleteNode(Node *node) {
        Node *smallest;

        if (node->left == nullptr) {
            transplant(node, node->right);
        } else if (node->right == nullptr) {
            transplant(node, node->left);
        } else {
            smallest = succesorNode(node->right);

            if (smallest->parent != node) {
                root = transplant(smallest, smallest->right);
                smallest->addRight(node->right);

            }
            root = transplant(node, smallest);
            smallest->addLeft(node->left);

        }

        delete node;
        return root;
    }

    Node *d(Node *node) {
        Node *smallest;

        if (node->left == nullptr) {
            transplant(node, node->right);
        } else if (node->right == nullptr) {
            transplant(node, node->left);
        } else {
            smallest = succesorNode(node);
            if (smallest->parent != node) {
                root = transplant(smallest, smallest->right);
                smallest->addRight(node->right);

            }

            root = transplant(node, smallest);
            smallest->addLeft(node->left);
        }
        return root;
    }

    void print(Node *node, int rootValue) {
        if (node == nullptr) {
            return;
        }

        if (node->value == rootValue) {
            cout << rootValue << endl;
        } else {
            cout << rootValue << " -> " << node->value << endl;
        }

        print(node->left, node->value);
        print(node->right, node->value);
    }
};
