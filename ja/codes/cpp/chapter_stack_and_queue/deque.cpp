/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    /* 両端キューを初期化する */
    deque<int> deque;

    /* 要素をエンキューする */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "両端キュー deque = ";
    printDeque(deque);

    /* 要素にアクセスする */
    int front = deque.front();
    cout << "キューの先頭要素 front = " << front << endl;
    int back = deque.back();
    cout << "キューの末尾要素 back = " << back << endl;

    /* 要素をデキューする */
    deque.pop_front();
    cout << "先頭からデキューした要素 popFront = " << front << "、先頭からデキューした後 deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "末尾からデキューした要素 popLast = " << back << "、末尾からデキューした後 deque = ";
    printDeque(deque);

    /* 両端キューの長さを取得する */
    int size = deque.size();
    cout << "両端キューの長さ size = " << size << endl;

    /* 両端キューが空かどうかを判定する */
    bool empty = deque.empty();
    cout << "両端キューは空か = " << empty << endl;

    return 0;
}
