/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 以鏈結串列實作佇列 */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // front 指向首節點，rear 指向尾節點
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // 走訪鏈結串列，逐一刪除節點並釋放記憶體
        freeMemoryLinkedList(front);
    }

    /* 取得佇列長度 */
    int size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 入隊 */
    void push(int num) {
        // 建立存有 num 的新節點，準備接到隊尾
        ListNode *node = new ListNode(num);
        // 若佇列為空，讓隊首與隊尾都指向新節點
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // 若佇列非空，將新節點接在尾節點之後
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出隊 */
    int pop() {
        int num = peek();
        // 移除首節點
        ListNode *tmp = front;
        front = front->next;
        // 釋放已移除節點的記憶體
        delete tmp;
        queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    int peek() {
        if (size() == 0)
            throw out_of_range("佇列為空");
        return front->val;
    }

    /* 將鏈結串列轉成 vector 並回傳 */
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

/* 範例程式 */
int main() {
    /* 初始化佇列 */
    LinkedListQueue *queue = new LinkedListQueue();

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

    // 釋放記憶體
    delete queue;

    return 0;
}
