/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 以環狀陣列實作雙端佇列 */
class ArrayDeque {
  private:
    vector<int> nums; // 存放雙端佇列元素的陣列
    int front;        // 隊首索引，記錄隊首元素在陣列中的位置
    int queSize;      // 雙端佇列長度

  public:
    /* 建構子 */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* 取得雙端佇列容量 */
    int capacity() {
        return nums.size();
    }

    /* 取得雙端佇列長度 */
    int size() {
        return queSize;
    }

    /* 判斷雙端佇列是否為空 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 計算環狀陣列的索引 */
    int index(int i) {
        // 取餘數，讓陣列的首尾相接
        // 當 i 超過陣列末端時，繞回開頭
        // 當 i 越過陣列開頭時，繞回末端
        return (i + capacity()) % capacity();
    }

    /* 從隊首加入元素 */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "雙端佇列已滿" << endl;
            return;
        }
        // 將隊首索引往左移一格
        // 取餘數，讓 front 越過陣列開頭時繞回末端
        front = index(front - 1);
        // 將 num 加到隊首
        nums[front] = num;
        queSize++;
    }

    /* 從隊尾加入元素 */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "雙端佇列已滿" << endl;
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        int rear = index(front + queSize);
        // 將 num 加到隊尾
        nums[rear] = num;
        queSize++;
    }

    /* 從隊首取出元素 */
    int popFirst() {
        int num = peekFirst();
        // 將隊首索引往後移一格
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 從隊尾取出元素 */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("雙端佇列為空");
        return nums[front];
    }

    /* 讀取隊尾元素 */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("雙端佇列為空");
        // 計算隊尾元素的索引
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 回傳 vector 以便輸出 */
    vector<int> toVector() {
        // 只轉換雙端佇列中實際存放的元素
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* 範例程式 */
int main() {
    /* 初始化雙端佇列 */
    ArrayDeque *deque = new ArrayDeque(10);
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
    cout << "將元素 4 加到隊尾後 deque = ";
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
    return 0;
}
