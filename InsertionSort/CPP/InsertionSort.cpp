//
// Created by Shahriar Nasim Nafi on 28/6/22.
//

void insertionSort(int *array, int size) {
    for (int i = 1; i < size; i++) {
        int value = array[i];
        int j = i - 1;
        while (j >= 0 && value < array[j]) {
            array[j + 1] = array[j];
            j -= 1;
        }
        array[j + 1] = value;
    }
}