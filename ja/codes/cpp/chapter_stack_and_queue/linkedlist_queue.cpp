/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 連結リストを使ったキュー */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // front は先頭ノード、rear は末尾ノードを指す
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // 連結リストをたどり、各ノードを削除してメモリを解放する
        freeMemoryLinkedList(front);
    }

    /* キューの要素数を取得する */
    int size() {
        return queSize;
    }

    /* キューが空かどうかを判定する */
    bool isEmpty() {
        return queSize == 0;
    }

    /* エンキューする */
    void push(int num) {
        // 値が num のノードを末尾ノードの後ろに追加する
        ListNode *node = new ListNode(num);
        // キューが空なら、先頭と末尾の両方がこのノードを指すようにする
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* デキューする */
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

    /* キューの先頭要素を参照する */
    int peek() {
        if (size() == 0)
            throw out_of_range("キューが空です");
        return front->val;
    }

    /* 連結リストを vector に変換して返す */
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

/* 実行例 */
int main() {
    /* キューを初期化する */
    LinkedListQueue *queue = new LinkedListQueue();

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

    // メモリを解放する
    delete queue;

    return 0;
}
