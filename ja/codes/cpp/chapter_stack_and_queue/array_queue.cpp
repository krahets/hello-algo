/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 循環配列に基づくキュークラス */
class ArrayQueue {
  private:
    int *nums;       // キュー要素を格納する配列
    int front;       // 先頭ポインタ、先頭要素を指す
    int queSize;     // キューの長さ
    int queCapacity; // キューの容量

  public:
    ArrayQueue(int capacity) {
        // 配列を初期化
        nums = new int[capacity];
        queCapacity = capacity;
        front = queSize = 0;
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* キューの容量を取得 */
    int capacity() {
        return queCapacity;
    }

    /* キューの長さを取得 */
    int size() {
        return queSize;
    }

    /* キューが空かどうかを判定 */
    bool isEmpty() {
        return size() == 0;
    }

    /* エンキュー */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "Queue is full" << endl;
            return;
        }
        // 末尾ポインタを計算、末尾インデックス + 1を指す
        // 剰余演算を使用して末尾ポインタが配列の末尾から先頭に戻るようにラップ
        int rear = (front + queSize) % queCapacity;
        // numを末尾に追加
        nums[rear] = num;
        queSize++;
    }

    /* デキュー */
    int pop() {
        int num = peek();
        // 先頭ポインタを1つ後ろに移動、末尾を超えた場合は配列の先頭に戻る
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* 先頭要素にアクセス */
    int peek() {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        return nums[front];
    }

    /* 配列をVectorに変換して返却 */
    vector<int> toVector() {
        // 有効な長さ範囲内の要素のみを変換
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* ドライバーコード */
int main() {
    /* キューを初期化 */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* 要素エンキュー */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "Queue queue = ";
    printVector(queue->toVector());

    /* 先頭要素にアクセス */
    int peek = queue->peek();
    cout << "Front element peek = " << peek << endl;

    /* 要素デキュー */
    peek = queue->pop();
    cout << "Element dequeued = " << peek << ", after dequeuing";
    printVector(queue->toVector());

    /* キューの長さを取得 */
    int size = queue->size();
    cout << "Length of the queue size = " << size << endl;

    /* キューが空かどうかを判定 */
    bool empty = queue->isEmpty();
    cout << "Is the queue empty = " << empty << endl;

    /* 循環配列をテスト */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "After the " << i << "th round of enqueueing + dequeuing, queue = ";
        printVector(queue->toVector());
    }

    // メモリを解放
    delete queue;

    return 0;
}