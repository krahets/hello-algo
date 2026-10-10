/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 循環配列ベースのキュー */
class ArrayQueue {
  private:
    int *nums;       // キュー要素を格納する配列
    int front;       // 先頭ポインタ。先頭要素を指す
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
            cout << "キューがいっぱいです" << endl;
            return;
        }
        // 末尾ポインタを計算し、末尾インデックス + 1 を指す
        // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
        int rear = (front + queSize) % queCapacity;
        // num をキュー末尾に追加
        nums[rear] = num;
        queSize++;
    }

    /* デキュー */
    int pop() {
        int num = peek();
        // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
    int peek() {
        if (isEmpty())
            throw out_of_range("キューが空です");
        return nums[front];
    }

    /* 配列を Vector に変換して返す */
    vector<int> toVector() {
        // 有効長の範囲内のリスト要素のみを変換
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* Driver Code */
int main() {
    /* キューを初期化 */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* 要素をエンキュー */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "キュー queue = ";
    printVector(queue->toVector());

    /* キュー先頭の要素にアクセス */
    int peek = queue->peek();
    cout << "先頭要素 peek = " << peek << endl;

    /* 要素をデキュー */
    peek = queue->pop();
    cout << "取り出した要素 pop = " << peek << "、取り出し後の queue = ";
    printVector(queue->toVector());

    /* キューの長さを取得 */
    int size = queue->size();
    cout << "キューの長さ size = " << size << endl;

    /* キューが空かどうかを判定 */
    bool empty = queue->isEmpty();
    cout << "キューが空かどうか = " << empty << endl;

    /* 循環配列をテストする */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "第 " << i << " 回のエンキュー + デキュー後の queue = ";
        printVector(queue->toVector());
    }

    // メモリを解放する
    delete queue;

    return 0;
}
