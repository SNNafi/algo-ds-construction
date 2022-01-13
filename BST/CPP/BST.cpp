//
// Created by Shahriar Nasim Nafi on 13/1/22.
//

#include <iostream>

using namespace std;

template<class T>
class BST {
    T value;
    BST *left = NULL;
    BST *right = NULL;

public:
    explicit BST(T value) {
        this->value = value;
    }

    // Avareage: O(logn) time | O(1) space
    // Worst: O(n) time | O(1) space
    // Insert new value & return BST. So that we can use bst->insert(3)->insert(2)
    BST *insert(T value) {
        BST *current = this;
        while (true) {
            if (value < current->value) {
                if (current->left) {
                    current = current->left;
                } else {
                    current->left = new BST(value);
                    break;
                }
            } else {
                if (current->right) {
                    current = current->right;
                } else {
                    current->right = new BST(value);
                    break;
                }
            }
        }
        return this;
    }

    // Avareage: O(logn) time | O(1) space
    // Worst: O(n) time | O(1) space
    // check if contains
    bool contain(T value) {
        BST *current = this;
        while (current) {
            if (value < current->value) {
                current = current->left;
            } else if (value > current->value) {
                current = current->right;
            } else {
                return true;
            }
        }
        return false;
    }

    // Avareage: O(logn) time | O(1) space
    // Worst: O(n) time | O(1) space
    // Remove specific value & return BST. So that we can use bst->remove(3)->remove(2)
    BST *remove(T value, BST *parent = NULL) {
        BST *current = this;
        while (current) {
            if (value < current->value) {
                parent = current;
                current = current->left;
            } else if (value > current->value) {
                parent = current;
                current = current->right;
            } else {
                if (current->left && current->right) {
                    current->value = current->right->getMinValue();
                    current->right->remove(current->value, current);
                } else if (!parent) {
                    if (current->left) {
                        current->value = current->left->value;
                        current->right = current->left->right;
                        current->left = current->left->left;
                    } else if (current->right) {
                        current->value = current->right->value;
                        current->left = current->right->left;
                        current->right = current->right->right;
                    } else {
                        current->value = NULL;
                    }
                } else if (parent->left == current) {
                    parent->left = current->left ? current->left : current->right;
                } else if (parent->right == current) {
                    parent->right = current->right ? current->right : current->left;
                }
                break;
            }
        }
        return this;
    }

    // Avareage: O(logn) time | O(1) space
    // Worst: O(n) time | O(1) space
    // Remove specific value & return if it is removed or false if not is found
    bool removed(T value, BST *parent = NULL) {
        BST *current = this;
        while (current) {
            if (value < current->value) {
                parent = current;
                current = current->left;
            } else if (value > current->value) {
                parent = current;
                current = current->right;
            } else {
                if (current->left && current->right) {
                    current->value = current->right->getMinValue();
                    current->right->remove(current->value, current);
                } else if (!parent) {
                    if (current->left) {
                        current->value = current->left->value;
                        current->right = current->left->right;
                        current->left = current->left->left;
                    } else if (current->right) {
                        current->value = current->right->value;
                        current->left = current->right->left;
                        current->right = current->right->right;
                    } else {
                        current->value = NULL;
                    }
                } else if (parent->left == current) {
                    parent->left = current->left ? current->left : current->right;
                } else if (parent->right == current) {
                    parent->right = current->right ? current->right : current->left;
                }
                return true;
            }
        }
        return false;
    }

    // Avareage: O(logn) time | O(1) space
    // Worst: O(n) time | O(1) space
    // Get the minimum value of a node
    T getMinValue() {
        BST *current = this;
        while (current->left) {
            current = current->left;
        }
        return current->value;
    }

    void print(BST *bst = NULL, int level = 1) {
        if (bst == NULL)
            return;
        for (int i = 0; i < level; i++) {
            printf(i == level - 1 ? "|-" : "  ");
        }
        printf("%d\n", bst->value);
        print(bst->left, level + 1);
        print(bst->right, level + 1);
    }

};

