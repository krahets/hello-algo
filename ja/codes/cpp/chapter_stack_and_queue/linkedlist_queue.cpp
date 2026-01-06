/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 連結リストに基づくキュークラス */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // 先頭ノードfront、末尾ノードrear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // 連結リストを走査、ノードを削除、メモリを解放
        freeMemoryLinkedList(front);
    }

    /* キューの長さを取得 */
    int size() {
        return queSize;
    }

    /* キューが空かどうかを判定 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* エンキュー */
    void push(int num) {
        // 末尾ノードの後ろにnumを追加
        ListNode *node = new ListNode(num);
        // キューが空の場合、先頭と末尾ノードの両方をそのノードに向ける
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // キューが空でない場合、そのノードを末尾ノードの後ろに追加
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* デキュー */
    int pop() {
        int num = peek();
        // 先頭ノードを削除
        ListNode *tmp = front;
        front = front->next;
        // メモリを解放
        delete tmp;
        queSize--;
        return num;
    }

    /* 先頭要素にアクセス */
    int peek() {
        if (size() == 0)
            throw out_of_range("Queue is empty");
        return front->val;
    }

    /* 連結リストをVectorに変換して返却 */
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

/* ドライバーコード */
int main() {
    /* キューを初期化 */
    LinkedListQueue *queue = new LinkedListQueue();

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

    // メモリを解放
    delete queue;

    return 0;
}