/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 双方向連結リストのノード */
struct DoublyListNode {
    int val;              // ノードの値
    DoublyListNode *next; // 次のノードへのポインタ
    DoublyListNode *prev; // 前のノードへのポインタ
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* 双方向連結リストを使った両端キュー */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // front は先頭ノード、rear は末尾ノードを指す
    int queSize = 0;              // 両端キューの要素数

  public:
    /* コンストラクタ */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* デストラクタ */
    ~LinkedListDeque() {
        // 連結リストをたどり、各ノードを削除してメモリを解放する
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* 両端キューの要素数を取得する */
    int size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    bool isEmpty() {
        return size() == 0;
    }

    /* 両端キューに要素を追加する */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // リストが空なら、front と rear の両方が node を指すようにする
        if (isEmpty())
            front = rear = node;
        // 先頭に追加する
        else if (isFront) {
            // node をリストの先頭に追加する
            front->prev = node;
            node->next = front;
            front = node; // 先頭ノードを更新する
        // 末尾に追加する
        } else {
            // node をリストの末尾に追加する
            rear->next = node;
            node->prev = rear;
            rear = node; // 末尾ノードを更新する
        }
        queSize++; // 両端キューの要素数を更新する
    }

    /* 先頭に追加する */
    void pushFirst(int num) {
        push(num, true);
    }

    /* 末尾に追加する */
    void pushLast(int num) {
        push(num, false);
    }

    /* 両端キューから要素を取り出す */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        int val;
        // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
        if (queSize == 1) {
            val = front->val;
            delete front; // 同じノードを指しているので、解放は一度でよい
            front = nullptr;
            rear = nullptr;
        }
        // 先頭から取り出す
        else if (isFront) {
            val = front->val; // 先頭ノードの値を一時的に保存する
            // 先頭ノードを削除する
            DoublyListNode *fNext = front->next;
            fNext->prev = nullptr;
            front->next = nullptr;
            delete front;
            front = fNext; // 先頭ノードを更新する
        // 末尾から取り出す
        } else {
            val = rear->val; // 末尾ノードの値を一時的に保存する
            // 末尾ノードを削除する
            DoublyListNode *rPrev = rear->prev;
            rPrev->next = nullptr;
            rear->prev = nullptr;
            delete rear;
            rear = rPrev; // 末尾ノードを更新する
        }
        queSize--; // 両端キューの要素数を更新する
        return val;
    }

    /* 先頭から取り出す */
    int popFirst() {
        return pop(true);
    }

    /* 末尾から取り出す */
    int popLast() {
        return pop(false);
    }

    /* 両端キューの先頭要素を参照する */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        return front->val;
    }

    /* 両端キューの末尾要素を参照する */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        return rear->val;
    }

    /* 表示用の vector を返す */
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

/* 実行例 */
int main() {
    /* 両端キューを初期化する */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "両端キュー deque = ";
    printVector(deque->toVector());

    /* 要素を参照する */
    int peekFirst = deque->peekFirst();
    cout << "先頭要素 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "末尾要素 peekLast = " << peekLast << endl;

    /* 要素を両端キューに追加する */
    deque->pushLast(4);
    cout << "末尾に 4 を追加した後の deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "先頭に 1 を追加した後の deque = ";
    printVector(deque->toVector());

    /* 両端キューから要素を取り出す */
    int popLast = deque->popLast();
    cout << "末尾から取り出した要素 = " << popLast << "、末尾から取り出した後の deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "先頭から取り出した要素 = " << popFirst << "、先頭から取り出した後の deque = ";
    printVector(deque->toVector());

    /* 両端キューの要素数を取得する */
    int size = deque->size();
    cout << "両端キューの要素数 size = " << size << endl;

    /* 両端キューが空かどうかを判定する */
    bool isEmpty = deque->isEmpty();
    cout << "両端キューは空か = " << boolalpha << isEmpty << endl;

    // メモリを解放する
    delete deque;

    return 0;
}
