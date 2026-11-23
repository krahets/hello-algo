/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 循環配列で実装した両端キュー */
class ArrayDeque {
  private:
    vector<int> nums; // 両端キューの要素を格納する配列
    int front;        // キューの先頭要素を指す先頭ポインタ
    int queSize;      // 両端キューの長さ

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

    /* 両端キューの長さを取得する */
    int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 循環配列のインデックスを計算する */
    int index(int i) {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        return (i + capacity()) % capacity();
    }

    /* 先頭にエンキューする */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "両端キューが満杯です" << endl;
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        front = index(front - 1);
        // num をキューの先頭に追加する
        nums[front] = num;
        queSize++;
    }

    /* 末尾にエンキューする */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "両端キューが満杯です" << endl;
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        int rear = index(front + queSize);
        // num をキューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* 先頭からデキューする */
    int popFirst() {
        int num = peekFirst();
        // 先頭ポインタを後ろに 1 つ移動する
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 末尾からデキューする */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        return nums[front];
    }

    /* キューの末尾要素にアクセスする */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        // 末尾要素のインデックスを計算する
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 表示用の配列を返す */
    vector<int> toVector() {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* 実行用コード */
int main() {
    /* 両端キューを初期化する */
    ArrayDeque *deque = new ArrayDeque(10);
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "両端キュー deque = ";
    printVector(deque->toVector());

    /* 要素にアクセスする */
    int peekFirst = deque->peekFirst();
    cout << "キューの先頭要素 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "キューの末尾要素 peekLast = " << peekLast << endl;

    /* 要素をエンキューする */
    deque->pushLast(4);
    cout << "要素 4 を末尾にエンキューした後 deque = ";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "要素 1 を先頭にエンキューした後 deque = ";
    printVector(deque->toVector());

    /* 要素をデキューする */
    int popLast = deque->popLast();
    cout << "末尾からデキューした要素 = " << popLast << "、末尾からデキューした後 deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "先頭からデキューした要素 = " << popFirst << "、先頭からデキューした後 deque = ";
    printVector(deque->toVector());

    /* 両端キューの長さを取得する */
    int size = deque->size();
    cout << "両端キューの長さ size = " << size << endl;

    /* 両端キューが空かどうかを判定する */
    bool isEmpty = deque->isEmpty();
    cout << "両端キューは空か = " << boolalpha << isEmpty << endl;
    return 0;
}
