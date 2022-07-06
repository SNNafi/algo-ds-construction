//
// Created by Shahriar Nasim Nafi on 7/7/22.
//

#include <iostream>

using namespace std;

const int MAX = 100;

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


struct PriorityQueue {
public:
    static int extractMax(int *heap, int n) {
        int max = heap[0];
        heap[0] = heap[n - 1];
        n--;
        MaxHeapify::maxHeapify(heap, n - 1, 0);
        return max;
    }


    static void insert(int value, int *heap, int n) {
        heap[n] = value;
        int i = n;

        n++;

        int p = MaxHeapify::parent(i);
        while (i > 0 && heap[i] > heap[p]) {
            int temp = heap[i];
            heap[i] = heap[p];
            heap[p] = temp;
            i = p;
            p = MaxHeapify::parent(i);
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

//
// Created by Shahriar Nasim Nafi on 7/7/22.
//

#include <iostream>

using namespace std;

const int MAX = 100;

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


struct PriorityQueue {
public:
    static int extractMax(int *heap, int n) {
        int max = heap[0];
        heap[0] = heap[n - 1];
        n--;
        MaxHeapify::maxHeapify(heap, n - 1, 0);
        return max;
    }


    static void insert(int value, int *heap, int n) {
        heap[n] = value;
        int i = n;

        n++;

        int p = MaxHeapify::parent(i);
        while (i > 0 && heap[i] > heap[p]) {
            int temp = heap[i];
            heap[i] = heap[p];
            heap[p] = temp;
            i = p;
            p = MaxHeapify::parent(i);
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