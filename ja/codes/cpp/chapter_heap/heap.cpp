/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    // [region]{init}
    /* ヒープを初期化する */
    // 最小ヒープを初期化する
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // 最大ヒープを初期化する
    priority_queue<int, vector<int>, less<int>> maxHeap;
    // [endregion]{init}

    cout << "\n以下のテストケースは最大ヒープを対象とする" << endl;

    // [region]{push}
    /* ヒープに要素を挿入する */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);
    // [endregion]{push}
    printHeap(maxHeap);

    // [region]{peek}
    /* ヒープの先頭要素を取得する */
    int peek = maxHeap.top(); // 5
    // [endregion]{peek}
    cout << "\nヒープの先頭要素は " << peek << endl;

    cout << "\nヒープから取り出した要素は " << maxHeap.top() << endl;
    // [region]{pop_1}
    /* ヒープの先頭要素を取り出す */
    // 取り出した要素は降順の列を形成する
    maxHeap.pop(); // 5
    // [endregion]{pop_1}
    printHeap(maxHeap);
    cout << "\nヒープから取り出した要素は " << maxHeap.top() << endl;
    // [region]{pop_2}
    maxHeap.pop(); // 4
    // [endregion]{pop_2}
    printHeap(maxHeap);
    cout << "\nヒープから取り出した要素は " << maxHeap.top() << endl;
    // [region]{pop_3}
    maxHeap.pop(); // 3
    // [endregion]{pop_3}
    printHeap(maxHeap);
    cout << "\nヒープから取り出した要素は " << maxHeap.top() << endl;
    // [region]{pop_4}
    maxHeap.pop(); // 2
    // [endregion]{pop_4}
    printHeap(maxHeap);
    cout << "\nヒープから取り出した要素は " << maxHeap.top() << endl;
    // [region]{pop_5}
    maxHeap.pop(); // 1
    // [endregion]{pop_5}
    printHeap(maxHeap);

    // [region]{size}
    /* ヒープのサイズを取得する */
    int size = maxHeap.size();
    // [endregion]{size}
    cout << "\nヒープの要素数は " << size << endl;

    // [region]{is_empty}
    /* ヒープが空か判定 */
    bool isEmpty = maxHeap.empty();
    // [endregion]{is_empty}
    cout << "\nヒープは空か " << isEmpty << endl;

    // [region]{heapify}
    /* リストを入力してヒープを構築する */
    // 時間計算量は O(n) であり、O(nlogn) ではない
    vector<int> input{1, 3, 2, 5, 4};
    minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
    // [endregion]{heapify}
    cout << "リストを入力して最小ヒープを構築した後" << endl;
    printHeap(minHeap);

    return 0;
}
