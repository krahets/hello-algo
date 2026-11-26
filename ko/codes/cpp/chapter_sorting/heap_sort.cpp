/**
 * File: heap_sort.cpp
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 길이 n인 힙에서 노드 i부터 아래로 내려가며 힙 속성 복원 */
void siftDown(vector<int> &nums, int n, int i) {
    while (true) {
        // 노드 i, l, r 중 값이 가장 큰 노드를 ma에 기록
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나 더 진행할 필요가 없으면 종료
        if (ma == i) {
            break;
        }
        // 두 노드 교환
        swap(nums[i], nums[ma]);
        // 아래로 내려가며 힙 속성 복원 반복
        i = ma;
    }
}

/* 힙 정렬 */
void heapSort(vector<int> &nums) {
    // 힙 구성: 리프 노드를 제외한 모든 노드에서 힙 속성 복원
    for (int i = nums.size() / 2 - 1; i >= 0; --i) {
        siftDown(nums, nums.size(), i);
    }
    // 힙에서 최댓값 추출을 n-1회 반복
    for (int i = nums.size() - 1; i > 0; --i) {
        // 루트 노드와 맨 오른쪽 리프 노드 교환(첫 원소와 마지막 원소 교환)
        swap(nums[0], nums[i]);
        // 루트 노드부터 아래로 내려가며 힙 속성 복원
        siftDown(nums, i, 0);
    }
}

/* 실행 예제 */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    cout << "힙 정렬 후 nums = ";
    printVector(nums);

    return 0;
}
