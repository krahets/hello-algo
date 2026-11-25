/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // 힙에 원소 삽입
    cout << "\n원소 " << val << " 삽입 후" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\n루트 원소 " << val << " 제거 후" << endl;
    printHeap(heap);
}

/* 실행 예제 */
int main() {
    /* 힙 초기화 */
    // 최소 힙 초기화
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // 최대 힙 초기화
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\n다음은 최대 힙 테스트 예제다." << endl;

    /* 힙에 원소 삽입 */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* 힙의 루트 원소 구하기 */
    int peek = maxHeap.top();
    cout << "\n힙의 루트 원소: " << peek << endl;

    /* 힙의 루트 원소 꺼내기 */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* 힙 크기 구하기 */
    int size = maxHeap.size();
    cout << "\n힙의 원소 수: " << size << endl;

    /* 힙이 비었는지 확인 */
    bool isEmpty = maxHeap.empty();
    cout << "\n빈 힙 여부: " << isEmpty << endl;

    /* 입력 리스트로 힙 구성 */
    // 시간 복잡도는 O(nlogn)이 아니라 O(n)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "입력 리스트로 만든 최소 힙" << endl;
    printHeap(minHeap);

    return 0;
}
