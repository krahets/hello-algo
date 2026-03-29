/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 双方向連結リストノード */
struct DoublyListNode {
    int val;              // ノード値
    DoublyListNode *next; // 後継ノードへのポインタ
    DoublyListNode *prev; // 前駆ノードへのポインタ
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* 双方向連結リストベースの両端キュー */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // 先頭ノード front、末尾ノード rear
    int queSize = 0;              // 両端キューの長さ

  public:
    /* コンストラクタ */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* デストラクタメソッド */
    ~LinkedListDeque() {
        // 連結リストを走査してノードを削除し、メモリを解放する
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
        // 連結リストが空なら、front と rear の両方を node に向ける
        if (isEmpty())
            front = rear = node;
        // 先頭へのエンキュー操作
        else if (isFront) {
            // node を連結リストの先頭に追加
            front->prev = node;
            node->next = front;
            front = node; // 先頭ノードを更新する
        // 末尾へのエンキュー操作
        } else {
            // node を連結リストの末尾に追加
            rear->next = node;
            node->prev = rear;
            rear = node; // 末尾ノードを更新する
        }
        queSize++; // キューの長さを更新
    }

    /* キュー先頭にエンキュー */
    void pushFirst(int num) {
        push(num, true);
    }

    /* キュー末尾にエンキュー */
    void pushLast(int num) {
        push(num, false);
    }

    /* デキュー操作 */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("キューが空です");
        int val;
        // キュー先頭からの取り出し
        if (isFront) {
            val = front->val; // 先頭ノードの値を一時保存
            // 先頭ノードを削除
            DoublyListNode *fNext = front->next;
            if (fNext != nullptr) {
                fNext->prev = nullptr;
                front->next = nullptr;
            }
            delete front;
            front = fNext; // 先頭ノードを更新する
        // キュー末尾からの取り出し
        } else {
            val = rear->val; // 末尾ノードの値を一時保存
            // 末尾ノードを削除
            DoublyListNode *rPrev = rear->prev;
            if (rPrev != nullptr) {
                rPrev->next = nullptr;
                rear->prev = nullptr;
            }
            delete rear;
            rear = rPrev; // 末尾ノードを更新する
        }
        queSize--; // キューの長さを更新
        return val;
    }

    /* キュー先頭からデキュー */
    int popFirst() {
        return pop(true);
    }

    /* キュー末尾からデキュー */
    int popLast() {
        return pop(false);
    }

    /* キュー先頭の要素にアクセス */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        return front->val;
    }

    /* キュー末尾の要素にアクセス */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("両端キューが空です");
        return rear->val;
    }

    /* 出力用の配列を返す */
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

/* Driver Code */
int main() {
    /* 両端キューを初期化 */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "両端キュー deque = ";
    printVector(deque->toVector());

    /* 要素にアクセス */
    int peekFirst = deque->peekFirst();
    cout << "先頭要素 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "末尾要素 peekLast = " << peekLast << endl;

    /* 要素をエンキュー */
    deque->pushLast(4);
    cout << "要素 4 を末尾に追加した後の deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "要素 1 を先頭に追加した後 deque = ";
    printVector(deque->toVector());

    /* 要素をデキュー */
    int popLast = deque->popLast();
    cout << "末尾から取り出した要素 = " << popLast << "、末尾から取り出した後 deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "先頭から取り出した要素 = " << popFirst << "、先頭から取り出した後 deque = ";
    printVector(deque->toVector());

    /* 両端キューの長さを取得 */
    int size = deque->size();
    cout << "両端キューの長さ size = " << size << endl;

    /* 両端キューが空かどうかを判定 */
    bool isEmpty = deque->isEmpty();
    cout << "両端キューが空かどうか = " << boolalpha << isEmpty << endl;

    // メモリを解放する
    delete deque;

    return 0;
}
