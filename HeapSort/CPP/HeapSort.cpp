//
// Created by Shahriar Nasim Nafi on 5/7/22.
//

#include <iostream>

using namespace std;

struct MaxHeapify {
    static int left(int i) {
        return (i + 1) * 2 - 1;
    }

    static int right(int i) {
        return (i + 1) * 2;
    }

    static int parent(int i) {
        return (i + 1) / 2 - 1;
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
        for (int i = heapSize / 2 - 1; i >= 0; i--) {
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

void _heapSort(int *heap, int heapSize) {
    for (int i = heapSize; i > 0; i--) {
        int temp = heap[0];
        heap[0] = heap[i];
        heap[i] = temp;
        MaxHeapify::maxHeapify(heap, i - 1, 0);
    }
}

void heapSort(int *array, int n) {

    int heapSize = n - 1;
    MaxHeapify::buildHeap(array, heapSize);

    for (int i = heapSize; i > 0; i--) {
        int temp = array[0];
        array[0] = array[i];
        array[i] = temp;
        MaxHeapify::maxHeapify(array, i - 1, 0);
    }
}
