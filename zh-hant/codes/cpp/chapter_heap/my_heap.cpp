/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 大頂堆積 */
class MaxHeap {
  private:
    // 使用動態陣列，這樣無須考慮擴容問題
    vector<int> maxHeap;

    /* 獲取左子節點的索引 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 獲取右子節點的索引 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 獲取父節點的索引 */
    int parent(int i) {
        return (i - 1) / 2; // 向下整除
    }

    /* 從節點 i 開始，從底至頂堆積化 */
    void siftUp(int i) {
        while (true) {
            // 獲取節點 i 的父節點
            int p = parent(i);
            // 當“越過根節點”或“節點無須修復”時，結束堆積化
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交換兩節點
            swap(maxHeap[i], maxHeap[p]);
            // 迴圈向上堆積化
            i = p;
        }
    }

    /* 從節點 i 開始，從頂至底堆積化 */
    void siftDown(int i) {
        while (true) {
            // 判斷節點 i, l, r 中值最大的節點，記為 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 迴圈向下堆積化
            i = ma;
        }
    }

  public:
    /* 建構子，根據輸入串列建堆積 */
    MaxHeap(vector<int> nums) {
        // 將串列元素原封不動新增進堆積
        maxHeap = nums;
        // 堆積化除葉節點以外的其他所有節點
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 獲取堆積大小 */
    int size() {
        return maxHeap.size();
    }

    /* 判斷堆積是否為空 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 訪問堆積頂元素 */
    int peek() {
        return maxHeap[0];
    }

    /* 元素入堆積 */
    void push(int val) {
        // 新增節點
        maxHeap.push_back(val);
        // 從底至頂堆積化
        siftUp(size() - 1);
    }

    /* 元素出堆積 */
    void pop() {
        // 判空處理
        if (isEmpty()) {
            throw out_of_range("堆積為空");
        }
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // 刪除節點
        maxHeap.pop_back();
        // 從頂至底堆積化
        siftDown(0);
    }

    /* 列印堆積（二元樹）*/
    void print() {
        cout << "堆積的陣列表示：";
        printVector(maxHeap);
        cout << "堆積的樹狀表示：" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Driver Code */
int main() {
    /* 初始化大頂堆積 */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\n輸入串列並建堆積後" << endl;
    maxHeap.print();

    /* 獲取堆積頂元素 */
    int peek = maxHeap.peek();
    cout << "\n堆積頂元素為 " << peek << endl;

    /* 元素入堆積 */
    int val = 7;
    maxHeap.push(val);
    cout << "\n元素 " << val << " 入堆積後" << endl;
    maxHeap.print();

    /* 堆積頂元素出堆積 */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\n堆積頂元素 " << peek << " 出堆積後" << endl;
    maxHeap.print();

    /* 獲取堆積大小 */
    int size = maxHeap.size();
    cout << "\n堆積元素數量為 " << size << endl;

    /* 判斷堆積是否為空 */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\n堆積是否為空 " << isEmpty << endl;

    return 0;
}
