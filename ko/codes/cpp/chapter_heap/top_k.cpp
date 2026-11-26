/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 힙을 이용해 배열에서 가장 큰 원소 k개 찾기 */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // 최소 힙 초기화
    priority_queue<int, vector<int>, greater<int>> heap;
    // 배열의 처음 k개 원소를 힙에 삽입
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // k+1번째 원소부터 힙의 크기를 k로 유지
    for (int i = k; i < nums.size(); i++) {
        // 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// 실행 예제
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "가장 큰 원소 " << k << " 개: ";
    printHeap(res);

    return 0;
}
