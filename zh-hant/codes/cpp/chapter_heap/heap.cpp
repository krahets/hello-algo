/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init}
    /* 初始化堆積 */
    // 初始化小頂堆積
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // 初始化大頂堆積
    priority_queue<int, vector<int>, less<int>> maxHeap;
    // [endregion]{init}

    cout << "\n以下測試樣例為大頂堆積" << endl;

    // [region]{push}
    /* 元素入堆積 */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);
    // [endregion]{push}
    printHeap(maxHeap);

    // [region]{peek}
    /* 獲取堆積頂元素 */
    int peek = maxHeap.top(); // 5
    // [endregion]{peek}
    cout << "\n堆積頂元素為 " << peek << endl;

    cout << "\n出堆積元素為 " << maxHeap.top() << endl;
    // [region]{pop_1}
    /* 堆積頂元素出堆積 */
    // 出堆積元素會形成一個從大到小的序列
    maxHeap.pop(); // 5
    // [endregion]{pop_1}
    printHeap(maxHeap);
    cout << "\n出堆積元素為 " << maxHeap.top() << endl;
    // [region]{pop_2}
    maxHeap.pop(); // 4
    // [endregion]{pop_2}
    printHeap(maxHeap);
    cout << "\n出堆積元素為 " << maxHeap.top() << endl;
    // [region]{pop_3}
    maxHeap.pop(); // 3
    // [endregion]{pop_3}
    printHeap(maxHeap);
    cout << "\n出堆積元素為 " << maxHeap.top() << endl;
    // [region]{pop_4}
    maxHeap.pop(); // 2
    // [endregion]{pop_4}
    printHeap(maxHeap);
    cout << "\n出堆積元素為 " << maxHeap.top() << endl;
    // [region]{pop_5}
    maxHeap.pop(); // 1
    // [endregion]{pop_5}
    printHeap(maxHeap);

    // [region]{size}
    /* 獲取堆積大小 */
    int size = maxHeap.size();
    // [endregion]{size}
    cout << "\n堆積元素數量為 " << size << endl;

    // [region]{is_empty}
    /* 判斷堆積是否為空 */
    bool isEmpty = maxHeap.empty();
    // [endregion]{is_empty}
    cout << "\n堆積是否為空 " << isEmpty << endl;

    // [region]{heapify}
    /* 輸入串列並建堆積 */
    // 時間複雜度為 O(n) ，而非 O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
    // [endregion]{heapify}
    cout << "輸入串列並建立小頂堆積後" << endl;
    printHeap(minHeap);

    return 0;
}
