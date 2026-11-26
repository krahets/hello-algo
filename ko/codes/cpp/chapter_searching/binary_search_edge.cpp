/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 이진 탐색으로 삽입 위치 찾기(중복 원소가 있는 경우) */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 닫힌구간 [0, n-1]을 초기화한다.
    while (i <= j) {
        int m = i + (j - i) / 2; // 중점 인덱스 m을 계산한다.
        if (nums[m] < target) {
            i = m + 1; // target을 찾을 구간은 [m+1, j]이다.
        } else {
            j = m - 1; // target보다 작은 원소 중 가장 오른쪽 원소를 찾을 구간은 [i, m-1]이다.
        }
    }
    // 삽입 위치 i를 반환한다.
    return i;
}

/* 이진 탐색으로 가장 왼쪽의 target 찾기 */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // target의 삽입 위치를 찾는 것과 같다.
    int i = binarySearchInsertion(nums, target);
    // target을 찾지 못했으므로 -1을 반환한다.
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // target을 찾았으므로 인덱스 i를 반환한다.
    return i;
}

/* 이진 탐색으로 가장 오른쪽의 target 찾기 */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // 가장 왼쪽의 target + 1을 찾는 문제로 바꾼다.
    int i = binarySearchInsertion(nums, target + 1);
    // j는 가장 오른쪽의 target을, i는 target보다 큰 첫 원소를 가리킨다.
    int j = i - 1;
    // target을 찾지 못했으므로 -1을 반환한다.
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // target을 찾았으므로 인덱스 j를 반환한다.
    return j;
}

/* 실행 예제 */
int main() {
    // 중복 원소가 있는 배열
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n배열 nums = ";
    printVector(nums);

    // 이진 탐색으로 왼쪽 경계와 오른쪽 경계 찾기
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "찾을 값 = " << target << " | 첫 인덱스 = " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "찾을 값 = " << target << " | 마지막 인덱스 = " << index << endl;
    }

    return 0;
}
