/**
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 버블 정렬 */
void bubbleSort(vector<int> &nums) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1] 교환
                // 여기서는 std::swap() 함수 사용
                swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* 플래그로 최적화한 버블 정렬*/
void bubbleSortWithFlag(vector<int> &nums) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // 플래그 초기화
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1] 교환
                // 여기서는 std::swap() 함수 사용
                swap(nums[j], nums[j + 1]);
                flag = true; // 원소가 교환되었음을 기록
            }
        }
        if (!flag)
            break; // 이 회전에서 교환이 한 번도 없으면 바로 종료
    }
}

/* 실행 예제 */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    cout << "버블 정렬 후 nums = ";
    printVector(nums);

    vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    cout << "버블 정렬 후 nums1 = ";
    printVector(nums1);

    return 0;
}
