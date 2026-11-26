/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 以環狀陣列實作佇列 */
class ArrayQueue {
  private:
    int *nums;       // 存放佇列元素的陣列
    int front;       // 隊首索引，記錄隊首元素在陣列中的位置
    int queSize;     // 佇列長度
    int queCapacity; // 佇列容量

  public:
    ArrayQueue(int capacity) {
        // 初始化陣列
        nums = new int[capacity];
        queCapacity = capacity;
        front = queSize = 0;
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* 取得佇列容量 */
    int capacity() {
        return queCapacity;
    }

    /* 取得佇列長度 */
    int size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 入隊 */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "佇列已滿" << endl;
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        // 取餘數，讓 rear 超過陣列末端時繞回開頭
        int rear = (front + queSize) % queCapacity;
        // 將 num 加到隊尾
        nums[rear] = num;
        queSize++;
    }

    /* 出隊 */
    int pop() {
        int num = peek();
        // 將隊首索引往後移一格，若超過陣列末端就繞回開頭
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    int peek() {
        if (isEmpty())
            throw out_of_range("佇列為空");
        return nums[front];
    }

    /* 將陣列轉成 vector 並回傳 */
    vector<int> toVector() {
        // 只轉換佇列中實際存放的元素
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* 範例程式 */
int main() {
    /* 初始化佇列 */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* 將元素加入佇列 */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "佇列 queue = ";
    printVector(queue->toVector());

    /* 讀取隊首元素 */
    int peek = queue->peek();
    cout << "隊首元素 peek = " << peek << endl;

    /* 從佇列取出元素 */
    peek = queue->pop();
    cout << "出隊元素 pop = " << peek << "，出隊後 queue = ";
    printVector(queue->toVector());

    /* 取得佇列長度 */
    int size = queue->size();
    cout << "佇列長度 size = " << size << endl;

    /* 判斷佇列是否為空 */
    bool empty = queue->isEmpty();
    cout << "佇列是否為空 = " << empty << endl;

    /* 測試環狀陣列 */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "第 " << i << " 輪入隊 + 出隊後 queue = ";
        printVector(queue->toVector());
    }

    // 釋放記憶體
    delete queue;

    return 0;
}
