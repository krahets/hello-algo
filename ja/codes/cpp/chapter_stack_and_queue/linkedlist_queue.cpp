/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 連結リストベースのキュー */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // 先頭ノード front、末尾ノード rear
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

    /* キューが空かどうかを判定 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* エンキュー */
    void push(int num) {
        // 末尾ノードの後ろに num を追加
        ListNode *node = new ListNode(num);
        // キューが空なら、先頭・末尾ノードをともにそのノードに設定
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // キューが空でなければ、そのノードを末尾ノードの後ろに追加
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
        // メモリを解放する
        delete tmp;
        queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
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

/* Driver Code */
int main() {
    /* キューを初期化 */
    LinkedListQueue *queue = new LinkedListQueue();

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

    // メモリを解放する
    delete queue;

    return 0;
}
