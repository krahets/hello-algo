/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    // [region]{init}
    /* 힙 초기화 */
    // 최소 힙 초기화
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // 최대 힙 초기화
    priority_queue<int, vector<int>, less<int>> maxHeap;
    // [endregion]{init}

    cout << "\n다음 테스트 예제는 최대 힙이다" << endl;

    // [region]{push}
    /* 힙에 원소 삽입 */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);
    // [endregion]{push}
    printHeap(maxHeap);

    // [region]{peek}
    /* 힙의 루트 원소 반환 */
    int peek = maxHeap.top(); // 5
    // [endregion]{peek}
    cout << "\n힙의 루트 원소: " << peek << endl;

    // [region]{pop_1}
    /* 힙의 루트 원소 꺼내기 */
    // 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
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
    /* 힙 크기 반환 */
    int size = maxHeap.size();
    // [endregion]{size}
    cout << "\n힙의 원소 개수: " << size << endl;

    // [region]{is_empty}
    /* 힙이 비어 있는지 판단 */
    bool isEmpty = maxHeap.empty();
    // [endregion]{is_empty}
    cout << "\n힙이 비어 있는가: " << isEmpty << endl;

    // [region]{heapify}
    /* 리스트를 입력하여 힙 구성 */
    // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
    vector<int> input{1, 3, 2, 5, 4};
    minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
    // [endregion]{heapify}
    cout << "리스트를 입력하여 최소 힙을 구성한 후" << endl;
    printHeap(minHeap);

    return 0;
}
