/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 連結リストで実装したキュー */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // 先頭ノード front 、末尾ノード rear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // 連結リストを走査してノードを削除し、メモリを解放する
        freeMemoryLinkedList(front);
    }

    /* キューの長さを取得 */
    int size() {
        return queSize;
    }

    /* キューが空か判定 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* エンキュー */
    void push(int num) {
        // 末尾ノードの後ろに num を追加する
        ListNode *node = new ListNode(num);
        // キューが空の場合、先頭と末尾の両方がこのノードを指すようにする
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // キューが空でない場合、このノードを末尾ノードの後ろに追加する
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* デキュー */
    int pop() {
        int num = peek();
        // 先頭ノードを削除する
        ListNode *tmp = front;
        front = front->next;
        // メモリを解放する
        delete tmp;
        queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    int peek() {
        if (size() == 0)
            throw out_of_range("キューが空です");
        return front->val;
    }

    /* 連結リストを Vector に変換して返す */
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

/* 実行用コード */
int main() {
    /* キューを初期化する */
    LinkedListQueue *queue = new LinkedListQueue();

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

    // メモリを解放する
    delete queue;

    return 0;
}
