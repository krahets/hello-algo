#include "../include/include.hpp"
template <typename Tp, typename _Compare = less<Tp>>
class Heap : public priority_queue<Tp, vector<Tp>, _Compare>
/**
 * 1. c++的priority_queue，即堆，默认的是大根堆
 * 2. priority_queue没有提供迭代器,但是注意到存数据的容器是protected的,可以在继承之后使用
 */
{
public:
    Heap() = default;
    template <typename _InputIterator>
    Heap(_InputIterator __first, _InputIterator __last) : priority_queue<Tp, vector<Tp>, _Compare>(__first, __last) {}
    void testPush(Tp val) {
        this->push(val);  // 元素入堆
        cout << "\n元素 " << val << " 入堆后" << endl;
        print();
    }
    void testPoll() {
        int val = this->top();  // 堆顶元素
        this->pop();            // 堆顶元素出堆
        cout << "\n元素 " << val << " 出堆后" << endl;
        print();
    }
    void print() {
        cout << "堆的数组表示：" << endl;
        PrintUtil::printVector(this->c);
        cout << "堆的树状表示：" << endl;
        TreeNode* tree = vecToTree(this->c);
        PrintUtil::printTree(tree);
        freeMemoryTree(tree);
    }
};
int main() {
    // 初始化小顶堆
    Heap<int, greater<int>> minHeap;
    // 初始化大顶堆
    Heap<int> maxHeap;

    cout << "\n以下测试样例为大顶堆" << endl;

    /* 元素入堆 */
    maxHeap.testPush(1);
    maxHeap.testPush(3);
    maxHeap.testPush(2);
    maxHeap.testPush(5);
    maxHeap.testPush(4);

    /* 获取堆顶元素 */
    int peek = maxHeap.top();
    cout << "\n堆顶元素为 " << peek << endl;

    /* 堆顶元素出堆 */
    maxHeap.testPoll();
    maxHeap.testPoll();
    maxHeap.testPoll();
    maxHeap.testPoll();
    maxHeap.testPoll();

    /* 获取堆大小 */
    int size = maxHeap.size();
    cout << "\n堆元素数量为 " << size << endl;

    /* 判断堆是否为空 */
    bool isEmpty = maxHeap.empty();
    cout << "\n堆是否为空 " << isEmpty << endl;
    vector<int> tmp({1, 3, 2, 5, 4});
    minHeap = Heap<int, greater<int>>(tmp.begin(), tmp.end());
    cout << endl
         << "输入列表并建立小顶堆后" << endl;
    minHeap.print();
}