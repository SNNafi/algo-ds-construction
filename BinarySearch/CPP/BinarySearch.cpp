//
// Created by Shahriar Nasim Nafi on 29/6/22.
//

int binarySearch(const int *array, int size, int x) {
    int left = 0;
    int right = size - 1;
    int mid = (left + right) / 2;

    while (left <= right) {
        mid = (left + right) / 2;
        if (array[mid] < x) {
            left = mid + 1;
        } else if (array[mid] > x) {
            right = mid - 1;
        } else {
            return mid;
        }
    }
    return -1;
}