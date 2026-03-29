/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 両端キューを初期化 */
    deque<int> deque;

    /* 要素をエンキュー */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "両端キュー deque = ";
    printDeque(deque);

    /* 要素にアクセス */
    int front = deque.front();
    cout << "先頭要素 front = " << front << endl;
    int back = deque.back();
    cout << "末尾要素 back = " << back << endl;

    /* 要素をデキュー */
    deque.pop_front();
    cout << "先頭から取り出した要素 popFront = " << front << "、先頭から取り出した後の deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "末尾から取り出した要素 popLast = " << back << "、末尾から取り出した後の deque = ";
    printDeque(deque);

    /* 両端キューの長さを取得 */
    int size = deque.size();
    cout << "両端キューの長さ size = " << size << endl;

    /* 両端キューが空かどうかを判定 */
    bool empty = deque.empty();
    cout << "両端キューが空かどうか = " << empty << endl;

    return 0;
}
