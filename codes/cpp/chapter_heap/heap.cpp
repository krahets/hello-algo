/**
 * File: heap.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、类型安全、const 正确性、规范命名
 */

#include "../utils/common.hpp"
#include <vector>
#include <queue>
#include <iostream>

// 元素入堆
void testPush(std::priority_queue<int>& heap, int val) {
    heap.push(val);
    std::cout << "\n元素 " << val << " 入堆后\n";
    printHeap(heap);
}

// 堆顶元素出堆
void testPop(std::priority_queue<int>& heap) {
    int val = heap.top();
    heap.pop();
    std::cout << "\n堆顶元素 " << val << " 出堆后\n";
    printHeap(heap);
}

/* Driver Code */
int main() {
    // 大顶堆
    std::priority_queue<int, std::vector<int>, std::less<int>> maxHeap;

    std::cout << "\n以下测试样例为大顶堆\n";

    // 元素入堆
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    // 获取堆顶元素
    int peek = maxHeap.top();
    std::cout << "\n堆顶元素为 " << peek << '\n';

    // 堆顶出堆
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    // 获取堆大小
    int size = static_cast<int>(maxHeap.size());
    std::cout << "\n堆元素数量为 " << size << '\n';

    // 判断是否为空
    bool isEmpty = maxHeap.empty();
    std::cout << "\n堆是否为空：" << std::boolalpha << isEmpty << '\n';

    // 从 vector 建小顶堆（时间复杂度 O(n)）
    std::vector<int> input = {1, 3, 2, 5, 4};
    std::priority_queue<int, std::vector<int>, std::greater<int>> minHeap(input.begin(), input.end());
    std::cout << "\n输入列表并建立小顶堆后\n";
    printHeap(minHeap);

    return 0;
}
