/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: Krahets (krahets@163.com)
 */

package chapter_heap;

import include.*;
import java.util.*;

class MaxHeap {
    // 使用列表而非数组，这样无需考虑扩容问题
    private List<Integer> maxHeap;

    /* 构造函数，建立空堆 */
    public MaxHeap() {
        maxHeap = new ArrayList<>();
    }

    /* 构造函数，堆化 nums 所有元素 */
    public MaxHeap(List<Integer> nums) {
        // 将元素拷贝至堆中
        maxHeap = new ArrayList<>(nums);
        // 堆化除叶结点以外的其他所有结点
        for (int i = parent(size() - 1); i >= 0; i--) {
            heapify(i);
        }
    }

    /* 获取左子结点索引 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 获取右子结点索引 */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 获取父结点索引 */
    private int parent(int i) {
        return (i - 1) / 2;
    }

    /* 交换元素 */
    private void swap(int i, int j) {
        int a = maxHeap.get(i), 
            b = maxHeap.get(j),
            tmp = a;
        maxHeap.set(i, b);
        maxHeap.set(j, tmp);
    }

    /* 获取堆大小 */
    public int size() {
        return maxHeap.size();
    }

    /* 判断堆是否为空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 访问堆顶元素 */
    public int peek() {
        return maxHeap.get(0);
    }

    /* 元素入堆 */
    public void push(int val) {
        // 添加结点
        maxHeap.add(val);
        // 从底至顶堆化
        int i = size() - 1;
        while (true) {
            int p = parent(i);
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            swap(i, p);
            i = p;
        }
    }

    /* 元素出堆 */
    public int poll() {
        // 判空处理
        if (isEmpty())
            throw new EmptyStackException();
        // 交换根结点与右下角（即最后一个）结点
        swap(0, size() - 1);
        // 删除结点
        int val = maxHeap.remove(size() - 1);
        // 从顶至底堆化
        heapify(0);
        // 返回堆顶元素
        return val;
    }

    /* 从结点 i 开始，从顶至底堆化 */
    private void heapify(int i) {
        while (true) {
            // 判断结点 i, l, r 中值最大的结点，记为 ma ；
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma)) ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma)) ma = r;
            // 若结点 i 最大，则无需继续堆化，跳出
            if (ma == i) break;
            // 交换结点 i 与结点 max
            swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }

    /* 打印堆（二叉树） */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}


public class my_heap {
    public static void testPush(MaxHeap maxHeap, int val) {
        // 元素入堆
        maxHeap.push(val);

        System.out.format("\n添加元素 %d 后\n", val);
        maxHeap.print();
    }

    public static void testPoll(MaxHeap maxHeap) {
        // 元素出堆
        int val = maxHeap.poll();

        System.out.format("\n出堆元素为 %d\n", val);
        maxHeap.print();
    }

    public static void main(String[] args) {
        /* 初始化堆 */
        // 初始化最大堆
        MaxHeap maxHeap = new MaxHeap();

        /* 元素入堆 */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* 获取堆顶元素 */
        int peek = maxHeap.peek();
        System.out.format("\n堆顶元素为 %d\n", peek);

        /* 元素出堆 */
        testPoll(maxHeap);
        testPoll(maxHeap);

        /* 获取堆大小 */
        int size = maxHeap.size();
        System.out.format("\n堆元素数量为 %d\n", size);

        /* 判断堆是否为空 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n堆是否为空 %b\n", isEmpty);
    }
}
