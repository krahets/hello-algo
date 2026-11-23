/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 双方向連結リストのノード */
struct DoublyListNode {
    int val;              // ノードの値
    DoublyListNode *next; // 後続ノードへのポインタ
    DoublyListNode *prev; // 前のノードへのポインタ
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* 双方向連結リストで実装した両端キュー */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // 先頭ノード front 、末尾ノード rear
    int queSize = 0;              // 両端キューの長さ

  public:
    /* コンストラクタ */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* デストラクタ */
    ~LinkedListDeque() {
        // 連結リストを走査してノードを削除し、メモリを解放する
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* 両端キューの長さを取得する */
    int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    bool isEmpty() {
        return size() == 0;
    }

    /* エンキュー操作 */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // 連結リストが空の場合、front と rear の両方が node を指すようにする
        if (isEmpty())
            front = rear = node;
        // 先頭へのエンキュー操作
        else if (isFront) {
            // node を連結リストの先頭に追加する
            front->prev = node;
            node->next = front;
            front = node; // 先頭ノードを更新する
        // 末尾へのエンキュー操作
        } else {
            // node を連結リストの末尾に追加する
            rear->next = node;
            node->prev = rear;
            rear = node; // 末尾ノードを更新する
        }
        queSize++; // キューの長さを更新する
    }

    /* 先頭にエンキューする */
    void pushFirst(int num) {
        push(num, true);
    }

    /* 末尾にエンキューする */
    void pushLast(int num) {
        push(num, false);
    }

    /* デキュー操作 */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("キューが空です");
        int val;
        // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if (queSize == 1) {
            val = front->val;
            delete front; // 同じノードを指しているため、片方を解放すればよい
            front = nullptr;
            rear = nullptr;
        }
        // 先頭からのデキュー操作
        else if (isFront) {
            val = front->val; // 先頭ノードの値を一時保存する
            // 先頭ノードを削除する
            DoublyListNode *fNext = front->next;
            fNext->prev = nullptr;
            front->next = nullptr;
            delete front;
            front = fNext; // 先頭ノードを更新する
        // 末尾からのデキュー操作
        } else {
            val = rear->val; // 末尾ノードの値を一時保存する
            // 末尾ノードを削除する
            DoublyListNode *rPrev = rear->prev;
            rPrev->next = nullptr;
            rear->prev = nullptr;
            delete rear;
            rear = rPrev; // 末尾ノードを更新する
        }
        queSize--; // キューの長さを更新する
        return val;
    }

    /* 先頭からデキューする */
    int popFirst() {
        return pop(true);
    }

    /* 末尾からデキューする */
    int popLast() {
        return pop(false);
    }

    /* キューの先頭要素にアクセス */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        return front->val;
    }

    /* キューの末尾要素にアクセスする */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        return rear->val;
    }

    /* 表示用の配列を返す */
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

/* 実行用コード */
int main() {
    /* 両端キューを初期化する */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "両端キュー deque = ";
    printVector(deque->toVector());

    /* 要素にアクセスする */
    int peekFirst = deque->peekFirst();
    cout << "キューの先頭要素 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "キューの末尾要素 peekLast = " << peekLast << endl;

    /* 要素をエンキューする */
    deque->pushLast(4);
    cout << "要素 4 を末尾にエンキューした後 deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "要素 1 を先頭にエンキューした後 deque = ";
    printVector(deque->toVector());

    /* 要素をデキューする */
    int popLast = deque->popLast();
    cout << "末尾からデキューした要素 = " << popLast << "、末尾からデキューした後 deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "先頭からデキューした要素 = " << popFirst << "、先頭からデキューした後 deque = ";
    printVector(deque->toVector());

    /* 両端キューの長さを取得する */
    int size = deque->size();
    cout << "両端キューの長さ size = " << size << endl;

    /* 両端キューが空かどうかを判定する */
    bool isEmpty = deque->isEmpty();
    cout << "両端キューは空か = " << boolalpha << isEmpty << endl;

    // メモリを解放する
    delete deque;

    return 0;
}
