/**
 * File: my_heap.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、类型安全、异常安全、规范命名
 */

#include "../utils/common.hpp"
#include <vector>
#include <stdexcept>
#include <iostream>
#include <algorithm>

/* 大顶堆 */
class MaxHeap {
private:
    std::vector<int> maxHeap;

    /* 获取左子节点索引 */
    int left(int i) const {
        return 2 * i + 1;
    }

    /* 获取右子节点索引 */
    int right(int i) const {
        return 2 * i + 2;
    }

    /* 获取父节点索引 */
    int parent(int i) const {
        return (i - 1) / 2;
    }

    /* 从底至顶堆化 */
    void siftUp(int i) {
        while (true) {
            int p = parent(i);
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            std::swap(maxHeap[i], maxHeap[p]);
            i = p;
        }
    }

    /* 从顶至底堆化 */
    void siftDown(int i) {
        while (true) {
            int l = left(i);
            int r = right(i);
            int ma = i;

            int n = static_cast<int>(maxHeap.size());
            if (l < n && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < n && maxHeap[r] > maxHeap[ma])
                ma = r;

            if (ma == i)
                break;

            std::swap(maxHeap[i], maxHeap[ma]);
            i = ma;
        }
    }

public:
    /* 构造方法：使用列表建堆 */
    explicit MaxHeap(const std::vector<int>& nums) {
        maxHeap = nums;
        int n = static_cast<int>(nums.size());
        int start = parent(n - 1);
        for (int i = start; i >= 0; --i) {
            siftDown(i);
        }
    }

    /* 获取堆大小 */
    int size() const {
        return static_cast<int>(maxHeap.size());
    }

    /* 判断堆是否为空 */
    bool isEmpty() const {
        return maxHeap.empty();
    }

    /* 访问堆顶元素 */
    int peek() const {
        if (isEmpty())
            throw std::out_of_range("堆为空");
        return maxHeap[0];
    }

    /* 元素入堆 */
    void push(int val) {
        maxHeap.push_back(val);
        siftUp(size() - 1);
    }

    /* 堆顶出堆 */
    void pop() {
        if (isEmpty())
            throw std::out_of_range("堆为空");

        std::swap(maxHeap[0], maxHeap.back());
        maxHeap.pop_back();
        siftDown(0);
    }

    /* 打印堆 */
    void print() const {
        std::cout << "堆的数组表示：";
        printVector(maxHeap);
        std::cout << "堆的树状表示：\n";
        TreeNode* root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Driver Code */
int main() {
    std::vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    std::cout << "\n输入列表并建堆后\n";
    maxHeap.print();

    int peek = maxHeap.peek();
    std::cout << "\n堆顶元素为 " << peek << '\n';

    int val = 7;
    maxHeap.push(val);
    std::cout << "\n元素 " << val << " 入堆后\n";
    maxHeap.print();

    peek = maxHeap.peek();
    maxHeap.pop();
    std::cout << "\n堆顶元素 " << peek << " 出堆后\n";
    maxHeap.print();

    int size = maxHeap.size();
    std::cout << "\n堆元素数量为 " << size << '\n';

    bool isEmpty = maxHeap.isEmpty();
    std::cout << "\n堆是否为空：" << std::boolalpha << isEmpty << '\n';

    return 0;
}
