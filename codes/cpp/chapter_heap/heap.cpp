/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init}
    /* 初始化堆 */
    // 初始化小顶堆
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // 初始化大顶堆
    priority_queue<int, vector<int>, less<int>> maxHeap;
    // [endregion]{init}

    cout << "\n以下测试样例为大顶堆" << endl;

    // [region]{push}
    /* 元素入堆 */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);
    // [endregion]{push}
    printHeap(maxHeap);

    // [region]{peek}
    /* 获取堆顶元素 */
    int peek = maxHeap.top(); // 5
    // [endregion]{peek}
    cout << "\n堆顶元素为 " << peek << endl;

    // [region]{pop_1}
    /* 堆顶元素出堆 */
    // 出堆元素会形成一个从大到小的序列
    maxHeap.pop(); // 5
    // [endregion]{pop_1}
    printHeap(maxHeap);
    // [region]{pop_2}
    maxHeap.pop(); // 4
    // [endregion]{pop_2}
    printHeap(maxHeap);
    // [region]{pop_3}
    maxHeap.pop(); // 3
    // [endregion]{pop_3}
    printHeap(maxHeap);
    // [region]{pop_4}
    maxHeap.pop(); // 2
    // [endregion]{pop_4}
    printHeap(maxHeap);
    // [region]{pop_5}
    maxHeap.pop(); // 1
    // [endregion]{pop_5}
    printHeap(maxHeap);

    // [region]{size}
    /* 获取堆大小 */
    int size = maxHeap.size();
    // [endregion]{size}
    cout << "\n堆元素数量为 " << size << endl;

    // [region]{is_empty}
    /* 判断堆是否为空 */
    bool isEmpty = maxHeap.empty();
    // [endregion]{is_empty}
    cout << "\n堆是否为空 " << isEmpty << endl;

    // [region]{heapify}
    /* 输入列表并建堆 */
    // 时间复杂度为 O(n) ，而非 O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
    // [endregion]{heapify}
    cout << "输入列表并建立小顶堆后" << endl;
    printHeap(minHeap);

    return 0;
}
