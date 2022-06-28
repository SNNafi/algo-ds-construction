//
// Created by Shahriar Nasim Nafi on 28/6/22.
//

void selectionSort(int *array, int size) {
    int minIdx = 0;
    for (int i = 0; i < size - 1; i++) {
        minIdx = i;
        for (int j = i + 1; j < size; j++) {
            if (array[j] < array[minIdx]) {
                minIdx = j;
            }
        }

        if (minIdx != i) {
            int temp = array[minIdx];
            array[minIdx] = array[i];
            array[i] = temp;
        }
    }
}