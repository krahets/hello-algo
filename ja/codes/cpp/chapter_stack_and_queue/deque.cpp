/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ドライバーコード */
int main() {
    /* 両端キューを初期化 */
    deque<int> deque;

    /* 要素エンキュー */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "Double-ended queue deque = ";
    printDeque(deque);

    /* 要素にアクセス */
    int front = deque.front();
    cout << "Front element of the queue front = " << front << endl;
    int back = deque.back();
    cout << "Back element of the queue back = " << back << endl;

    /* 要素デキュー */
    deque.pop_front();
    cout << "Front element dequeued = " << front << ", after dequeuing from the front";
    printDeque(deque);
    deque.pop_back();
    cout << "Back element dequeued = " << back << ", after dequeuing from the back";
    printDeque(deque);

    /* 両端キューの長さを取得 */
    int size = deque.size();
    cout << "Length of the double-ended queue size = " << size << endl;

    /* 両端キューが空かどうかを判定 */
    bool empty = deque.empty();
    cout << "Is the double-ended queue empty = " << empty << endl;

    return 0;
}