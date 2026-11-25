/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // 將元素加入堆積
    cout << "\n元素 " << val << " 加入堆積後" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\n堆積頂端元素 " << val << " 移出堆積後" << endl;
    printHeap(heap);
}

/* Driver Code */
int main() {
    /* 初始化堆積 */
    // 初始化最小堆積
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // 初始化最大堆積
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\n以下以最大堆積為測試案例" << endl;

    /* 將元素加入堆積 */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* 取得堆積頂端元素 */
    int peek = maxHeap.top();
    cout << "\n堆積頂端元素為 " << peek << endl;

    /* 取出堆積頂端元素 */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* 取得堆積大小 */
    int size = maxHeap.size();
    cout << "\n堆積中的元素個數為 " << size << endl;

    /* 判斷堆積是否為空 */
    bool isEmpty = maxHeap.empty();
    cout << "\n堆積是否為空 " << isEmpty << endl;

    /* 以輸入串列建立堆積 */
    // 時間複雜度為 O(n)，而非 O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "用輸入串列建立最小堆積後" << endl;
    printHeap(minHeap);

    return 0;
}
