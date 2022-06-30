//
// Created by Shahriar Nasim Nafi on 30/6/22.
//

#include <iostream>

using namespace std;

const int Q_SIZE = 5;

struct Queue {
private:
    int head = 0;
    int tail = 0;
    int data[Q_SIZE + 1] = {};

public:
    void enqueue(int value) {
        if ((tail + 1) % (Q_SIZE + 1) == head) {
            return;
        }
        data[tail] = value;
        tail = (tail + 1) % (Q_SIZE + 1);

    }

    int dequeue() {
        if (head == tail) {
            return -1;
        }
        int value = data[head++];
        head %= (Q_SIZE + 1);
        return value;
    }

};