//
// Created by Shahriar Nasim Nafi on 29/6/22.
//

#include <iostream>
using namespace std;

const int STACK_MAX = 100;

struct Stack {
private:
    int top = -1;
    int data[STACK_MAX] = {};
public:
    void push(int value) {
        if (STACK_MAX == top) {
            cout << "Stack is full!\n";
        } else {
            top += 1;
            data[top] = value;
        }
    }

    int pop() {
        if (top == -1) {
            std::cout << "Stack is empty!\n";
            return top;
        } else {
            top -= 1;
            return data[top + 1];
        }
    }

    void print() {
        if (top == -1) {
            return;
        }
        cout << endl;
        for (int i = 0; i <= top; i++) {
            cout << data[i] << " ";
        }
        cout << endl;
    }
};