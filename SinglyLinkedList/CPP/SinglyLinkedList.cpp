//
// Created by Shahriar Nasim Nafi on 1/7/22.
//

#include <iostream>

using namespace std;

struct Node {
    int value;
    Node *next;

    static Node *create(int item, Node *node) {
        Node *create = new Node();
        create->value = item;
        create->next = node;
        return create;
    }
};

struct LinkedList {
    Node *head;

    Node *prepend(int value) {
        Node *node = Node::create(value, head);
        head = node;
        return node;
    }

    Node *append(int value) {
        Node *node = Node::create(value, nullptr);
        if (head == nullptr) {
            head = node;
            return head;
        }

        Node *current = head;
        while (current->next) {
            current = current->next;
        }
        current->next = node;
        return node;
    }

    Node *insert(Node *node, int value) {
        Node *temp = node->next;
        node->next = Node::create(value, temp);
        return node->next;
    }

    Node *remove(Node *node) {
        if (head == node) {
            head = head->next; // or node->next
            delete node;
            return head;
        }

        Node *current = head;
        while (current) {
            if (current->next == node) {
                break;
            }
            current = current->next;
        }

        if (current == nullptr) {
            return head;
        }

        current->next = current->next->next;  // or node->next
        delete node;
        return head;
    }

    void print() {

        if (head == nullptr) {
            return;
        }

        Node *current = head;
        cout << endl;
        while (current) {
            cout << current->value << " ";
            current = current->next;
        }
        cout << endl;
    }
};