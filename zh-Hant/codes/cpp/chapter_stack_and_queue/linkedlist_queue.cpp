/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 基於鏈結串列實現的佇列 */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // 頭節點 front ，尾節點 rear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // 走訪鏈結串列刪除節點，釋放記憶體
        freeMemoryLinkedList(front);
    }

    /* 獲取佇列的長度 */
    int size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 入列 */
    void push(int num) {
        // 在尾節點後新增 num
        ListNode *node = new ListNode(num);
        // 如果佇列為空，則令頭、尾節點都指向該節點
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // 如果佇列不為空，則將該節點新增到尾節點後
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出列 */
    int pop() {
        int num = peek();
        // 刪除頭節點
        ListNode *tmp = front;
        front = front->next;
        // 釋放記憶體
        delete tmp;
        queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    int peek() {
        if (size() == 0)
            throw out_of_range("佇列為空");
        return front->val;
    }

    /* 將鏈結串列轉化為 Vector 並返回 */
    vector<int> toVector() {
        ListNode *node = front;
        vector<int> res(size());
        for (int i = 0; i < res.size(); i++) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* 初始化佇列 */
    LinkedListQueue *queue = new LinkedListQueue();

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

    // 釋放記憶體
    delete queue;

    return 0;
}
