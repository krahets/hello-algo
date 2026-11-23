/**
 * File: selection_sort.cpp
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 선택 정렬 */
void selectionSort(vector<int> &nums) {
    int n = nums.size();
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
    for (int i = 0; i < n - 1; i++) {
        // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // 최솟값의 인덱스를 기록한다
        }
        // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
        swap(nums[i], nums[k]);
    }
}

/* 실행 코드 */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    selectionSort(nums);

    cout << "선택 정렬을 마친 후 nums = ";
    printVector(nums);

    return 0;
}
