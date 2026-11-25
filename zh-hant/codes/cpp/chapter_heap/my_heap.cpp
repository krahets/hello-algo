/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 最大堆積 */
class MaxHeap {
  private:
    // 採用動態陣列，無須自行處理擴充容量的問題
    vector<int> maxHeap;

    /* 取得左子節點的索引 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    int parent(int i) {
        return (i - 1) / 2; // 向下取整的整數除法
    }

    /* 從節點 i 開始向上調整堆積 */
    void siftUp(int i) {
        while (true) {
            // 取得節點 i 的父節點
            int p = parent(i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交換兩個節點
            swap(maxHeap[i], maxHeap[p]);
            // 繼續向上調整堆積
            i = p;
        }
    }

    /* 從節點 i 開始向下調整堆積 */
    void siftDown(int i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 繼續向下調整堆積
            i = ma;
        }
    }

  public:
    /* 建構式，根據輸入串列建立堆積 */
    MaxHeap(vector<int> nums) {
        // 將串列元素依原順序全部加入堆積
        maxHeap = nums;
        // 從每個非葉節點向下調整堆積
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 取得堆積大小 */
    int size() {
        return maxHeap.size();
    }

    /* 判斷堆積是否為空 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 讀取堆積頂端元素 */
    int peek() {
        return maxHeap[0];
    }

    /* 將元素加入堆積 */
    void push(int val) {
        // 新增節點
        maxHeap.push_back(val);
        // 由下往上調整堆積
        siftUp(size() - 1);
    }

    /* 從堆積取出元素 */
    void pop() {
        // 檢查堆積是否為空
        if (isEmpty()) {
            throw out_of_range("堆積為空");
        }
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // 刪除節點
        maxHeap.pop_back();
        // 由上往下調整堆積
        siftDown(0);
    }

    /* 印出堆積（二元樹）*/
    void print() {
        cout << "堆積的陣列表示法：";
        printVector(maxHeap);
        cout << "堆積的樹狀表示法：" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Driver Code */
int main() {
    /* 初始化最大堆積 */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\n用輸入串列建立堆積後" << endl;
    maxHeap.print();

    /* 取得堆積頂端元素 */
    int peek = maxHeap.peek();
    cout << "\n堆積頂端元素為 " << peek << endl;

    /* 將元素加入堆積 */
    int val = 7;
    maxHeap.push(val);
    cout << "\n元素 " << val << " 加入堆積後" << endl;
    maxHeap.print();

    /* 取出堆積頂端元素 */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\n堆積頂端元素 " << peek << " 移出堆積後" << endl;
    maxHeap.print();

    /* 取得堆積大小 */
    int size = maxHeap.size();
    cout << "\n堆積中的元素個數為 " << size << endl;

    /* 判斷堆積是否為空 */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\n堆積是否為空 " << isEmpty << endl;

    return 0;
}
