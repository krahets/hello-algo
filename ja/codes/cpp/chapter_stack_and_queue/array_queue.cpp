/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 循環配列を使ったキュー */
class ArrayQueue {
  private:
    int *nums;       // キューの要素を格納する配列
    int front;       // キューの先頭要素を指すインデックス
    int queSize;     // キューの要素数
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

    /* キューの要素数を取得する */
    int size() {
        return queSize;
    }

    /* キューが空かどうかを判定する */
    bool isEmpty() {
        return size() == 0;
    }

    /* エンキューする */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "キューが満杯です" << endl;
            return;
        }
        // キューの末尾要素の次の位置を示すインデックスを求める
        // 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
        int rear = (front + queSize) % queCapacity;
        // num をキューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* デキューする */
    int pop() {
        int num = peek();
        // 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* キューの先頭要素を参照する */
    int peek() {
        if (isEmpty())
            throw out_of_range("キューが空です");
        return nums[front];
    }

    /* 配列を vector に変換して返す */
    vector<int> toVector() {
        // キューの要素数に当たる範囲だけを変換する
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* 実行例 */
int main() {
    /* キューを初期化する */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* 要素をキューに追加する */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "キュー queue = ";
    printVector(queue->toVector());

    /* キューの先頭要素を参照する */
    int peek = queue->peek();
    cout << "先頭要素 peek = " << peek << endl;

    /* キューから要素を取り出す */
    peek = queue->pop();
    cout << "デキューした要素 pop = " << peek << "、デキュー後の queue = ";
    printVector(queue->toVector());

    /* キューの要素数を取得する */
    int size = queue->size();
    cout << "キューの要素数 size = " << size << endl;

    /* キューが空かどうかを判定する */
    bool empty = queue->isEmpty();
    cout << "キューは空か = " << empty << endl;

    /* 循環配列の動作を確認する */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "第 " << i << " 回のエンキューとデキューを終えた後の queue = ";
        printVector(queue->toVector());
    }

    // メモリを解放する
    delete queue;

    return 0;
}
