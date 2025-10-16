/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 循環配列に基づく両端キュークラス */
class ArrayDeque {
  private:
    vector<int> nums; // 両端キューの要素を格納する配列
    int front;        // 先頭ポインタ、先頭要素を指す
    int queSize;      // 両端キューの長さ

  public:
    /* コンストラクタ */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* 両端キューの容量を取得 */
    int capacity() {
        return nums.size();
    }

    /* 両端キューの長さを取得 */
    int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 循環配列のインデックスを計算 */
    int index(int i) {
        // 剰余演算で循環配列を実現
        // iが配列の末尾を超えた場合、先頭に戻る
        // iが配列の先頭を超えた場合、末尾に戻る
        return (i + capacity()) % capacity();
    }

    /* 先頭エンキュー */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "Double-ended queue is full" << endl;
            return;
        }
        // 先頭ポインタを1つ左に移動
        // 剰余演算でfrontが配列の先頭を越えて末尾に戻ることを実現
        front = index(front - 1);
        // numを先頭に追加
        nums[front] = num;
        queSize++;
    }

    /* 末尾エンキュー */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "Double-ended queue is full" << endl;
            return;
        }
        // 末尾ポインタを計算、末尾インデックス + 1を指す
        int rear = index(front + queSize);
        // numを末尾に追加
        nums[rear] = num;
        queSize++;
    }

    /* 先頭デキュー */
    int popFirst() {
        int num = peekFirst();
        // 先頭ポインタを1つ後ろに移動
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 末尾デキュー */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 先頭要素にアクセス */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Double-ended queue is empty");
        return nums[front];
    }

    /* 末尾要素にアクセス */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Double-ended queue is empty");
        // 末尾要素のインデックスを計算
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 印刷用に配列を返却 */
    vector<int> toVector() {
        // 有効な長さ範囲内の要素のみを変換
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* ドライバーコード */
int main() {
    /* 両端キューを初期化 */
    ArrayDeque *deque = new ArrayDeque(10);
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Double-ended queue deque = ";
    printVector(deque->toVector());

    /* 要素にアクセス */
    int peekFirst = deque->peekFirst();
    cout << "Front element peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Back element peekLast = " << peekLast << endl;

    /* 要素エンキュー */
    deque->pushLast(4);
    cout << "Element 4 enqueued at the tail, deque = ";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "Element 1 enqueued at the head, deque = ";
    printVector(deque->toVector());

    /* 要素デキュー */
    int popLast = deque->popLast();
    cout << "Deque tail element = " << popLast << ", after dequeuing from the tail";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Deque front element = " << popFirst << ", after dequeuing from the front";
    printVector(deque->toVector());

    /* 両端キューの長さを取得 */
    int size = deque->size();
    cout << "Length of the double-ended queue size = " << size << endl;

    /* 両端キューが空かどうかを判定 */
    bool isEmpty = deque->isEmpty();
    cout << "Is the double-ended queue empty = " << boolalpha << isEmpty << endl;
    return 0;
}