/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 基於環形陣列實現的佇列 */
class ArrayQueue {
  private:
    int *nums;       // 用於儲存佇列元素的陣列
    int front;       // 佇列首指標，指向佇列首元素
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

    /* 獲取佇列的容量 */
    int capacity() {
        return queCapacity;
    }

    /* 獲取佇列的長度 */
    int size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 入列 */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "佇列已滿" << endl;
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
        int rear = (front + queSize) % queCapacity;
        // 將 num 新增至佇列尾
        nums[rear] = num;
        queSize++;
    }

    /* 出列 */
    int pop() {
        int num = peek();
        // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    int peek() {
        if (isEmpty())
            throw out_of_range("佇列為空");
        return nums[front];
    }

    /* 將陣列轉化為 Vector 並返回 */
    vector<int> toVector() {
        // 僅轉換有效長度範圍內的串列元素
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* Driver Code */
int main() {
    /* 初始化佇列 */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* 元素入列 */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "佇列 queue = ";
    printVector(queue->toVector());

    /* 訪問佇列首元素 */
    int peek = queue->peek();
    cout << "佇列首元素 peek = " << peek << endl;

    /* 元素出列 */
    peek = queue->pop();
    cout << "出列元素 pop = " << peek << "，出列後 queue = ";
    printVector(queue->toVector());

    /* 獲取佇列的長度 */
    int size = queue->size();
    cout << "佇列長度 size = " << size << endl;

    /* 判斷佇列是否為空 */
    bool empty = queue->isEmpty();
    cout << "佇列是否為空 = " << empty << endl;

    /* 測試環形陣列 */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "第 " << i << " 輪入列 + 出列後 queue = ";
        printVector(queue->toVector());
    }

    // 釋放記憶體
    delete queue;

    return 0;
}
