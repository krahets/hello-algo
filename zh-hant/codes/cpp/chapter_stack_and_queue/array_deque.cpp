/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 基於環形陣列實現的雙向佇列 */
class ArrayDeque {
  private:
    vector<int> nums; // 用於儲存雙向佇列元素的陣列
    int front;        // 佇列首指標，指向佇列首元素
    int queSize;      // 雙向佇列長度

  public:
    /* 建構子 */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* 獲取雙向佇列的容量 */
    int capacity() {
        return nums.size();
    }

    /* 獲取雙向佇列的長度 */
    int size() {
        return queSize;
    }

    /* 判斷雙向佇列是否為空 */
    bool isEmpty() {
        return queSize == 0;
    }

    /* 計算環形陣列索引 */
    int index(int i) {
        // 透過取餘操作實現陣列首尾相連
        // 當 i 越過陣列尾部後，回到頭部
        // 當 i 越過陣列頭部後，回到尾部
        return (i + capacity()) % capacity();
    }

    /* 佇列首入列 */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "雙向佇列已滿" << endl;
            return;
        }
        // 佇列首指標向左移動一位
        // 透過取餘操作實現 front 越過陣列頭部後回到尾部
        front = index(front - 1);
        // 將 num 新增至佇列首
        nums[front] = num;
        queSize++;
    }

    /* 佇列尾入列 */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "雙向佇列已滿" << endl;
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        int rear = index(front + queSize);
        // 將 num 新增至佇列尾
        nums[rear] = num;
        queSize++;
    }

    /* 佇列首出列 */
    int popFirst() {
        int num = peekFirst();
        // 佇列首指標向後移動一位
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 佇列尾出列 */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("雙向佇列為空");
        return nums[front];
    }

    /* 訪問佇列尾元素 */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("雙向佇列為空");
        // 計算尾元素索引
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 返回陣列用於列印 */
    vector<int> toVector() {
        // 僅轉換有效長度範圍內的串列元素
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* 初始化雙向佇列 */
    ArrayDeque *deque = new ArrayDeque(10);
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "雙向佇列 deque = ";
    printVector(deque->toVector());

    /* 訪問元素 */
    int peekFirst = deque->peekFirst();
    cout << "佇列首元素 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "佇列尾元素 peekLast = " << peekLast << endl;

    /* 元素入列 */
    deque->pushLast(4);
    cout << "元素 4 佇列尾入列後 deque = ";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "元素 1 佇列首入列後 deque = ";
    printVector(deque->toVector());

    /* 元素出列 */
    int popLast = deque->popLast();
    cout << "佇列尾出列元素 = " << popLast << "，佇列尾出列後 deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "佇列首出列元素 = " << popFirst << "，佇列首出列後 deque = ";
    printVector(deque->toVector());

    /* 獲取雙向佇列的長度 */
    int size = deque->size();
    cout << "雙向佇列長度 size = " << size << endl;

    /* 判斷雙向佇列是否為空 */
    bool isEmpty = deque->isEmpty();
    cout << "雙向佇列是否為空 = " << boolalpha << isEmpty << endl;
    return 0;
}
