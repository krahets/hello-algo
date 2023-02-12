/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../include/include.hpp"

/* 大顶堆 */
class MaxHeap {
private:
    // 使用动态数组，这样无需考虑扩容问题
    vector<int> maxHeap;

    /* 获取左子结点索引 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 获取右子结点索引 */
    int right(int i) {
        return 2 * i + 2;
    } 

    /* 获取父结点索引 */
    int parent(int i) {
        return (i - 1) / 2; // 向下取整
    }

    /* 从结点 i 开始，从底至顶堆化 */
    void siftUp(int i) {
        while (true) {
            // 获取结点 i 的父结点
            int p =  parent(i);
            // 当“越过根结点”或“结点无需修复”时，结束堆化
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交换两结点
            swap(maxHeap[i], maxHeap[p]);
            // 循环向上堆化
            i = p;
        }
    }

    /* 从结点 i 开始，从顶至底堆化 */
    void siftDown(int i) {
        while (true) {
            // 判断结点 i, l, r 中值最大的结点，记为 ma
            int l = left(i), r = right(i), ma = i;
            // 若结点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (l < size() && maxHeap[l] > maxHeap[ma]) 
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若结点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) 
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 循环向下堆化
            i = ma;
        }
    }

public:
    /* 构造方法，根据输入列表建堆 */
    MaxHeap(vector<int> nums) {
        // 将列表元素原封不动添加进堆
        maxHeap = nums;
        // 堆化除叶结点以外的其他所有结点
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 获取堆大小 */
    int size() {
        return maxHeap.size();
    }

    /* 判断堆是否为空 */
    bool empty() {
        return size() == 0;
    }

    /* 访问堆顶元素 */
    int peek() {
        return maxHeap[0];
    }

    /* 元素入堆 */
    void push(int val) {
        // 添加结点
        maxHeap.push_back(val);
        // 从底至顶堆化
        siftUp(size() - 1);
    }

    /* 元素出堆 */
    void poll() {
        // 判空处理
        if (empty()) {
            throw out_of_range("堆为空");
        }
        // 交换根结点与最右叶结点（即交换首元素与尾元素）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // 删除结点
        maxHeap.pop_back();
        // 从顶至底堆化
        siftDown(0);
    }

    /* 打印堆（二叉树）*/
    void print() {
        cout << "堆的数组表示：";
        PrintUtil::printVector(maxHeap);
        cout << "堆的树状表示：" << endl;
        TreeNode *root = vecToTree(maxHeap);
        PrintUtil::printTree(root);
        freeMemoryTree(root);
    }
};


void testPush(MaxHeap maxHeap, int val) {
    maxHeap.push(val);
    cout << "\n添加元素 " << val << " 后" << endl;
    maxHeap.print();
}

void testPop(MaxHeap maxHeap) {
    int val = maxHeap.peek();
    maxHeap.poll();
    cout << "\n出堆元素为 " << val << endl;
    maxHeap.print();
}

/* Driver Code */
int main() {
    /* 初始化大顶堆 */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxheap(vec);
    cout << "\n输入列表并建堆后" << endl;
    maxheap.print();

    /* 获取堆顶元素 */
    int peek = maxheap.peek();
    cout << "\n堆顶元素为 " << peek << endl;

    /* 元素入堆 */
    int val = 7;
    maxheap.push(val);
    cout << "\n元素 " << val << " 入堆后" << endl;
    maxheap.print();

    /* 堆顶元素出堆 */
    peek = maxheap.peek();
    maxheap.poll();
    cout << "\n堆顶元素 " << peek << " 出堆后" << endl;
    maxheap.print();

    /* 获取堆大小 */
    int size = maxheap.size();
    cout << "\n堆元素数量为 " << size << endl;

    /* 判断堆是否为空 */
    bool isEmpty = maxheap.empty();
    cout << "\n堆是否为空 " << isEmpty << endl;
}
