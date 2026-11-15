/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    // [region]{init_deque}
    /* 両端キューを初期化する */
    deque<int> deque;
    // [endregion]{init_deque}

    // [region]{push}
    /* 要素をエンキューする */
    deque.push_back(2); // キューの末尾に追加する
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // キューの先頭に追加する
    deque.push_front(1);
    // [endregion]{push}
    cout << "両端キュー deque = ";
    printDeque(deque);

    // [region]{peek_first}
    /* 要素にアクセスする */
    int front = deque.front(); // キューの先頭要素
    // [endregion]{peek_first}
    cout << "キューの先頭要素 front = " << front << endl;
    // [region]{peek_last}
    int back = deque.back(); // キューの末尾要素
    // [endregion]{peek_last}
    cout << "キューの末尾要素 back = " << back << endl;

    // [region]{pop_first}
    /* 要素をデキューする */
    deque.pop_front(); // キューの先頭要素をデキューする
    // [endregion]{pop_first}
    cout << "先頭からデキューした要素 popFront = " << front << "、先頭からデキューした後 deque = ";
    printDeque(deque);
    // [region]{pop_last}
    deque.pop_back(); // キューの末尾要素をデキューする
    // [endregion]{pop_last}
    cout << "末尾からデキューした要素 popLast = " << back << "、末尾からデキューした後 deque = ";
    printDeque(deque);

    // [region]{size}
    /* 両端キューの長さを取得する */
    int size = deque.size();
    // [endregion]{size}
    cout << "両端キューの長さ size = " << size << endl;

    // [region]{is_empty}
    /* 両端キューが空かどうかを判定する */
    bool empty = deque.empty();
    // [endregion]{is_empty}
    cout << "両端キューは空か = " << empty << endl;

    return 0;
}
