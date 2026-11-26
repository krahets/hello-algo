/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 雙向鏈結串列的節點 */
struct DoublyListNode {
    int val;              // 節點值
    DoublyListNode *next; // 指向下一個節點的指標
    DoublyListNode *prev; // 指向上一個節點的指標
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* 以雙向鏈結串列實作雙端佇列 */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // front 指向首節點，rear 指向尾節點
    int queSize = 0;              // 雙端佇列長度

  public:
    /* 建構子 */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* 解構子 */
    ~LinkedListDeque() {
        // 走訪鏈結串列，逐一刪除節點並釋放記憶體
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* 取得雙端佇列長度 */
    int size() {
        return queSize;
    }

    /* 判斷雙端佇列是否為空 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 加入元素 */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // 若鏈結串列為空，讓 front 和 rear 都指向 node
        if (isEmpty())
            front = rear = node;
        // 從隊首加入元素
        else if (isFront) {
            // 將 node 加到鏈結串列的開頭
            front->prev = node;
            node->next = front;
            front = node; // 更新首節點
        // 從隊尾加入元素
        } else {
            // 將 node 加到鏈結串列的末端
            rear->next = node;
            node->prev = rear;
            rear = node; // 更新尾節點
        }
        queSize++; // 將雙端佇列長度加 1
    }

    /* 從隊首加入元素 */
    void pushFirst(int num) {
        push(num, true);
    }

    /* 從隊尾加入元素 */
    void pushLast(int num) {
        push(num, false);
    }

    /* 取出元素 */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("雙端佇列為空");
        int val;
        // 佇列長度為 1 時，首尾兩端指向同一個節點
        if (queSize == 1) {
            val = front->val;
            delete front; // 兩者指向同一個節點，只需釋放一次
            front = nullptr;
            rear = nullptr;
        }
        // 從隊首取出元素
        else if (isFront) {
            val = front->val; // 暫存首節點的值
            // 移除首節點
            DoublyListNode *fNext = front->next;
            fNext->prev = nullptr;
            front->next = nullptr;
            delete front;
            front = fNext; // 更新首節點
        // 從隊尾取出元素
        } else {
            val = rear->val; // 暫存尾節點的值
            // 移除尾節點
            DoublyListNode *rPrev = rear->prev;
            rPrev->next = nullptr;
            rear->prev = nullptr;
            delete rear;
            rear = rPrev; // 更新尾節點
        }
        queSize--; // 將雙端佇列長度減 1
        return val;
    }

    /* 從隊首取出元素 */
    int popFirst() {
        return pop(true);
    }

    /* 從隊尾取出元素 */
    int popLast() {
        return pop(false);
    }

    /* 讀取隊首元素 */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("雙端佇列為空");
        return front->val;
    }

    /* 讀取隊尾元素 */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("雙端佇列為空");
        return rear->val;
    }

    /* 回傳 vector 以便輸出 */
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

/* 範例程式 */
int main() {
    /* 初始化雙端佇列 */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "雙端佇列 deque = ";
    printVector(deque->toVector());

    /* 讀取隊首與隊尾元素 */
    int peekFirst = deque->peekFirst();
    cout << "隊首元素 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "隊尾元素 peekLast = " << peekLast << endl;

    /* 將元素加入雙端佇列 */
    deque->pushLast(4);
    cout << "將元素 4 加到隊尾後 deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "將元素 1 加到隊首後 deque = ";
    printVector(deque->toVector());

    /* 從雙端佇列取出元素 */
    int popLast = deque->popLast();
    cout << "從隊尾取出的元素 = " << popLast << "，從隊尾取出後 deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "從隊首取出的元素 = " << popFirst << "，從隊首取出後 deque = ";
    printVector(deque->toVector());

    /* 取得雙端佇列長度 */
    int size = deque->size();
    cout << "雙端佇列長度 size = " << size << endl;

    /* 判斷雙端佇列是否為空 */
    bool isEmpty = deque->isEmpty();
    cout << "雙端佇列是否為空 = " << boolalpha << isEmpty << endl;

    // 釋放記憶體
    delete deque;

    return 0;
}
