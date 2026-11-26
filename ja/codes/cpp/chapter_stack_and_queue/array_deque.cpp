/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 循環配列を使った両端キュー */
class ArrayDeque {
  private:
    vector<int> nums; // 両端キューの要素を格納する配列
    int front;        // 両端キューの先頭要素を指すインデックス
    int queSize;      // 両端キューの要素数

  public:
    /* コンストラクタ */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* 両端キューの容量を取得する */
    int capacity() {
        return nums.size();
    }

    /* 両端キューの要素数を取得する */
    int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 循環配列のインデックスを求める */
    int index(int i) {
        // 剰余を使って配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭より前に出たら末尾に回る
        return (i + capacity()) % capacity();
    }

    /* 先頭に追加する */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "両端キューが満杯です" << endl;
            return;
        }
        // 先頭のインデックスを左に 1 つ移す
        // 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
        front = index(front - 1);
        // num を両端キューの先頭に追加する
        nums[front] = num;
        queSize++;
    }

    /* 末尾に追加する */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "両端キューが満杯です" << endl;
            return;
        }
        // 両端キューの末尾要素の次の位置を示すインデックスを求める
        int rear = index(front + queSize);
        // num を両端キューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* 先頭から取り出す */
    int popFirst() {
        int num = peekFirst();
        // 先頭のインデックスを 1 つ進める
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 末尾から取り出す */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 両端キューの先頭要素を参照する */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        return nums[front];
    }

    /* 両端キューの末尾要素を参照する */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        // 末尾要素のインデックスを求める
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 表示用の vector を返す */
    vector<int> toVector() {
        // 両端キューの要素数に当たる範囲だけを変換する
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* 実行例 */
int main() {
    /* 両端キューを初期化する */
    ArrayDeque *deque = new ArrayDeque(10);
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "両端キュー deque = ";
    printVector(deque->toVector());

    /* 要素を参照する */
    int peekFirst = deque->peekFirst();
    cout << "先頭要素 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "末尾要素 peekLast = " << peekLast << endl;

    /* 要素を両端キューに追加する */
    deque->pushLast(4);
    cout << "末尾に 4 を追加した後の deque = ";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "先頭に 1 を追加した後の deque = ";
    printVector(deque->toVector());

    /* 両端キューから要素を取り出す */
    int popLast = deque->popLast();
    cout << "末尾から取り出した要素 = " << popLast << "、末尾から取り出した後の deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "先頭から取り出した要素 = " << popFirst << "、先頭から取り出した後の deque = ";
    printVector(deque->toVector());

    /* 両端キューの要素数を取得する */
    int size = deque->size();
    cout << "両端キューの要素数 size = " << size << endl;

    /* 両端キューが空かどうかを判定する */
    bool isEmpty = deque->isEmpty();
    cout << "両端キューは空か = " << boolalpha << isEmpty << endl;
    return 0;
}
