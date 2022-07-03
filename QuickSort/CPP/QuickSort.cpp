//
// Created by Shahriar Nasim Nafi on 2/7/22.
//

#include <iostream>

using namespace std;

int partition(int array[], int start, int end) {

    int p = start - 1;
    int pivot = array[end - 1];

    for (int i = start; i < end - 1; i++) {
        if (pivot > array[i]) {
            p += 1;
            int temp = array[p];
            array[p] = array[i];
            array[i] = temp;
        }
    }

    p += 1;
    int temp = array[p];
    array[p] = pivot;
    array[end - 1] = temp;
    return p;

}

void quickSort(int array[], int start, int end) {

    if (start >= end) {
        return;
    }

    int p = partition(array, start, end);

    quickSort(array, start, p);
    quickSort(array, p + 1, end);
}
