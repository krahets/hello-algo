/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 삽입 위치의 이진 탐색(중복 원소 있음) */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 닫힌 구간 [0, n-1]을 초기화한다
    while (i <= j) {
        int m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
        if (nums[m] < target) {
            i = m + 1; // target은 구간 [m+1, j]에 있다
        } else {
            j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
        }
    }
    // 삽입 위치 i를 반환한다
    return i;
}

/* 가장 왼쪽에 있는 target을 이진 탐색 */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // target의 삽입 위치를 찾는 것과 같다
    int i = binarySearchInsertion(nums, target);
    // target을 찾지 못했으므로 -1을 반환한다
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // target을 찾았으므로 인덱스 i를 반환한다
    return i;
}

/* 가장 오른쪽에 있는 target을 이진 탐색 */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
    int i = binarySearchInsertion(nums, target + 1);
    // j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
    int j = i - 1;
    // target을 찾지 못했으므로 -1을 반환한다
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // target을 찾았으므로 인덱스 j를 반환한다
    return j;
}

/* 실행 코드 */
int main() {
    // 중복 원소를 포함하는 배열
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n배열 nums = ";
    printVector(nums);

    // 왼쪽 경계와 오른쪽 경계의 이진 탐색
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "가장 왼쪽 원소 " << target << " ; 인덱스: " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "가장 오른쪽 원소 " << target << " ; 인덱스: " << index << endl;
    }

    return 0;
}
