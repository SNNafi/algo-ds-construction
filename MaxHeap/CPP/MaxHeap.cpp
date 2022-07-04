//
// Created by Shahriar Nasim Nafi on 4/7/22.
//

#include <iostream>

using namespace std;

struct MaxHeapify {
    static int left(int i) {
        return i * 2;
    }

    static int right(int i) {
        return i * 2 + 1;
    }

    static int parent(int i) {
        return i / 2;
    }

    static void maxHeapify(int heap[], int heapSize, int root) {

        int largest = root;

        int left = MaxHeapify::left(root);
        int right = MaxHeapify::right(root);

        if (left <= heapSize && heap[left] > heap[largest]) {
            largest = left;
        }

        if (right <= heapSize && heap[right] > heap[largest]) {
            largest = right;
        }

        if (largest != root) {
            int temp = heap[root];
            heap[root] = heap[largest];
            heap[largest] = temp;

            maxHeapify(heap, heapSize, largest);
        }
    }

    static void buildHeap(int heap[], int heapSize) {
        for (int i = heapSize / 2; i >= 1; i--) {
            maxHeapify(heap, heapSize, i);
        }
    }
};

void heapPrinter(int *heap, int heapSize, int root) {

    if (root > heapSize) {
        return;
    }

    cout << heap[root] << endl;
    int left = MaxHeapify::left(root);
    int right = MaxHeapify::right(root);


    if (heapSize >= left) {
        cout << heap[root] << " - " << heap[left] << endl;
    }

    if (heapSize >= right) {
        cout << heap[root] << " - " << heap[right] << endl;
    }

    heapPrinter(heap, heapSize, left);
    heapPrinter(heap, heapSize, right);

}