/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // 최소 힙 초기화
    priority_queue<int, vector<int>, greater<int>> heap;
    // 배열의 앞쪽 k개 원소를 힙에 삽입한다
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // k+1번째 원소부터 힙의 길이를 k로 유지한다
    for (int i = k; i < nums.size(); i++) {
        // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// 실행 코드
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "가장 큰 " << k << " 개 원소: ";
    printHeap(res);

    return 0;
}
