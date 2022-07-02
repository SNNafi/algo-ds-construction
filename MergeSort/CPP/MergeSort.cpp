//
// Created by Shahriar Nasim Nafi on 2/7/22.
//

void merge(int *array, int left, int mid, int right) {

    int leftArraySize = mid - left + 1;

    int rightArraySize = right - mid;

    int sortedIndex = left;

    int leftArray[leftArraySize];
    int rightArray[rightArraySize];

    for (int i = 0; i < leftArraySize; i++) {
        leftArray[i] = array[left + i];
    }

    for (int i = 0; i < rightArraySize; i++) {
        rightArray[i] = array[mid + 1 + i];
    }

    int i = 0, j = 0;

    while (i < leftArraySize && j < rightArraySize) {
        if (leftArray[i] < rightArray[j]) {
            array[sortedIndex++] = leftArray[i++];
        } else if (leftArray[i] > rightArray[j]) {
            array[sortedIndex++] = rightArray[j++];
        } else {
            array[sortedIndex++] = leftArray[i++];
            array[sortedIndex++] = rightArray[j++];
        }
    }
    while (i < leftArraySize) {
        array[sortedIndex++] = leftArray[i++];
    }

    while (j < rightArraySize) {
        array[sortedIndex++] = rightArray[j++];

    }
}

void mergeSort(int *array, int left, int right) {

    if (left >= right) {
        return;
    }

    int mid = left + (right - left) / 2;

    mergeSort(array, left, mid);
    mergeSort(array, mid + 1, right);

    merge(array, left, mid, right);
}