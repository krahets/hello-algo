/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 循環配列で実装したキュー */
class ArrayQueue {
  private:
    int *nums;       // キューの要素を格納する配列
    int front;       // キューの先頭要素を指す先頭ポインタ
    int queSize;     // キューの長さ
    int queCapacity; // キューの容量

  public:
    ArrayQueue(int capacity) {
        // 配列を初期化する
        nums = new int[capacity];
        queCapacity = capacity;
        front = queSize = 0;
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* キューの容量を取得する */
    int capacity() {
        return queCapacity;
    }

    /* キューの長さを取得 */
    int size() {
        return queSize;
    }

    /* キューが空か判定 */
    bool isEmpty() {
        return size() == 0;
    }

    /* エンキュー */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "キューが満杯です" << endl;
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        // 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
        int rear = (front + queSize) % queCapacity;
        // num をキューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* デキュー */
    int pop() {
        int num = peek();
        // 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    int peek() {
        if (isEmpty())
            throw out_of_range("キューが空です");
        return nums[front];
    }

    /* 配列を Vector に変換して返す */
    vector<int> toVector() {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* 実行用コード */
int main() {
    /* キューを初期化する */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* 要素をエンキューする */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "キュー queue = ";
    printVector(queue->toVector());

    /* キューの先頭要素にアクセス */
    int peek = queue->peek();
    cout << "キューの先頭要素 peek = " << peek << endl;

    /* 要素をデキューする */
    peek = queue->pop();
    cout << "デキューした要素 pop = " << peek << "、デキュー後 queue = ";
    printVector(queue->toVector());

    /* キューの長さを取得 */
    int size = queue->size();
    cout << "キューの長さ size = " << size << endl;

    /* キューが空か判定 */
    bool empty = queue->isEmpty();
    cout << "キューは空か = " << empty << endl;

    /* 循環配列をテストする */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "第 " << i << " 回のエンキューとデキューの後 queue = ";
        printVector(queue->toVector());
    }

    // メモリを解放する
    delete queue;

    return 0;
}
