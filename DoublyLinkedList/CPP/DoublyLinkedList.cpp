//
// Created by Shahriar Nasim Nafi on 1/7/22.
//

#include <iostream>

using namespace std;


struct Node {
    int value;
    Node *previous;
    Node *next;

    static Node *create(int value, Node *previous, Node *next) {
        Node *node = new Node();
        node->value = value;
        node->previous = previous;
        node->next = next;
        return node;
    }
};

struct LinkedList {
    Node *head;
    Node *tail;

    Node *prepend(int value) {
        if (head == nullptr) {
            Node *node = Node::create(value, nullptr, nullptr);
            head = node;
            tail = node;
            return node;
        }

        Node *node = Node::create(value, nullptr, head);
        head->previous = node;
        head = node;
        return node;
    }

    Node *append(int value) {
        if (head == nullptr) {
            Node *node = Node::create(value, nullptr, nullptr);
            head = node;
            tail = node;
            return node;
        }

        if (tail == head) {
            Node *node = Node::create(value, head, nullptr);
            head->next = node;
            tail = node;
            return node;
        }

        Node *node = Node::create(value, tail, nullptr);
        tail->next = node;
        tail = tail->next;
        return node;
    }

    Node *insert(Node *node, int value) {
        Node *temp = node->next;
        Node *created = Node::create(value, node, temp);
        temp->previous = created;
        node->next = created;
        return node->next;
    }

    Node *remove(Node *node) {
        if (head == node) {
            head = head->next;
            if (head) {
                head->previous = nullptr;
            }
            delete node;
            return head;
        }

        if (tail == node) {
            tail = tail->previous;
            tail->next = nullptr;
            return head;
        }

        Node *previous = node->previous;
        Node *next = node->next;
        previous->next = next;
        next->previous = previous;
        delete node;
        return head;
    }

    void print() {
        if (head == nullptr) {
            return;
        }

        cout << endl;
        cout << "Linked List -> ";
        Node *current = head;

        while (current) {
            cout << current->value << " ";
            current = current->next;
        }

        cout << endl;
    }
};

