/**
 * File: selection_sort.cpp
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 선택 정렬 */
void selectionSort(vector<int> &nums) {
    int n = nums.size();
    // 바깥 루프: 미정렬 구간은 [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // 안쪽 루프: 미정렬 구간에서 최솟값 찾기
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // 최솟값의 인덱스 기록
        }
        // 최솟값과 미정렬 구간의 첫 원소 교환
        swap(nums[i], nums[k]);
    }
}

/* 실행 예제 */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    selectionSort(nums);

    cout << "선택 정렬 후 nums = ";
    printVector(nums);

    return 0;
}
