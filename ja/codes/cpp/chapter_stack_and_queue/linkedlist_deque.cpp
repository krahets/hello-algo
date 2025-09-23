/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 双方向連結リストノード */
struct DoublyListNode {
    int val;              // ノードの値
    DoublyListNode *next; // 後続ノードへのポインタ
    DoublyListNode *prev; // 前続ノードへのポインタ
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* 双方向連結リストに基づく両端キュークラス */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // 先頭ノードfront、末尾ノードrear
    int queSize = 0;              // 両端キューの長さ

  public:
    /* コンストラクタ */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* デストラクタ */
    ~LinkedListDeque() {
        // 連結リストを走査、ノードを削除、メモリを解放
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* 両端キューの長さを取得 */
    int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定 */
    bool isEmpty() {
        return size() == 0;
    }

    /* エンキュー操作 */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // リストが空の場合、frontとrearの両方をnodeに向ける
        if (isEmpty())
            front = rear = node;
        // 先頭エンキュー操作
        else if (isFront) {
            // ノードをリストの先頭に追加
            front->prev = node;
            node->next = front;
            front = node; // 先頭ノードを更新
        // 末尾エンキュー操作
        } else {
            // ノードをリストの末尾に追加
            rear->next = node;
            node->prev = rear;
            rear = node; // 末尾ノードを更新
        }
        queSize++; // キュー長を更新
    }

    /* 先頭エンキュー */
    void pushFirst(int num) {
        push(num, true);
    }

    /* 末尾エンキュー */
    void pushLast(int num) {
        push(num, false);
    }

    /* デキュー操作 */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("Queue is empty");
        int val;
        // 先頭デキュー操作
        if (isFront) {
            val = front->val; // 先頭ノードの値を一時保存
            // 先頭ノードを削除
            DoublyListNode *fNext = front->next;
            if (fNext != nullptr) {
                fNext->prev = nullptr;
                front->next = nullptr;
            }
            delete front;
            front = fNext; // 先頭ノードを更新
        // 末尾デキュー操作
        } else {
            val = rear->val; // 末尾ノードの値を一時保存
            // 末尾ノードを削除
            DoublyListNode *rPrev = rear->prev;
            if (rPrev != nullptr) {
                rPrev->next = nullptr;
                rear->prev = nullptr;
            }
            delete rear;
            rear = rPrev; // 末尾ノードを更新
        }
        queSize--; // キュー長を更新
        return val;
    }

    /* 先頭デキュー */
    int popFirst() {
        return pop(true);
    }

    /* 末尾デキュー */
    int popLast() {
        return pop(false);
    }

    /* 先頭要素にアクセス */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Double-ended queue is empty");
        return front->val;
    }

    /* 末尾要素にアクセス */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Double-ended queue is empty");
        return rear->val;
    }

    /* 印刷用に配列を返却 */
    vector<int> toVector() {
        DoublyListNode *node = front;
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
    /* 両端キューを初期化 */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Double-ended queue deque = ";
    printVector(deque->toVector());

    /* 要素にアクセス */
    int peekFirst = deque->peekFirst();
    cout << "Front element peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Back element peekLast = " << peekLast << endl;

    /* 要素エンキュー */
    deque->pushLast(4);
    cout << "Element 4 rear enqueued, deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "Element 1 enqueued at the head, deque = ";
    printVector(deque->toVector());

    /* 要素デキュー */
    int popLast = deque->popLast();
    cout << "Deque tail element = " << popLast << ", after dequeuing from the tail";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Deque front element = " << popFirst << ", after dequeuing from the front";
    printVector(deque->toVector());

    /* 両端キューの長さを取得 */
    int size = deque->size();
    cout << "Length of the double-ended queue size = " << size << endl;

    /* 両端キューが空かどうかを判定 */
    bool isEmpty = deque->isEmpty();
    cout << "Is the double-ended queue empty = " << boolalpha << isEmpty << endl;

    // メモリを解放
    delete deque;

    return 0;
}