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

    /* 构造函数，根据输入列表建堆 */
    public MaxHeap(List<Integer> nums) {
        // 所有元素入堆
        maxHeap = new ArrayList<>(nums);
        // 堆化除叶结点以外的其他所有结点
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
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
        return (i - 1) / 2; // 向下整除
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
        siftUp(size() - 1);
    }

    /* 从结点 i 开始，从底至顶堆化 */
    private void siftUp(int i) {
        while (true) {
            // 获取结点 i 的父结点
            int p = parent(i);
            // 当“越过根结点”或“结点无需修复”时，结束堆化
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 交换两结点
            swap(i, p);
            // 循环向上堆化
            i = p;
        }
    }

    /* 元素出堆 */
    public int poll() {
        // 判空处理
        if (isEmpty())
            throw new EmptyStackException();
        // 交换根结点与最右叶结点（即交换首元素与尾元素）
        swap(0, size() - 1);
        // 删除结点
        int val = maxHeap.remove(size() - 1);
        // 从顶至底堆化
        siftDown(0);
        // 返回堆顶元素
        return val;
    }

    /* 从结点 i 开始，从顶至底堆化 */
    private void siftDown(int i) {
        while (true) {
            // 判断结点 i, l, r 中值最大的结点，记为 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // 若结点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
            if (ma == i) break;
            // 交换两结点
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
        maxHeap.push(val);  // 元素入堆
        System.out.format("\n添加元素 %d 后\n", val);
        maxHeap.print();
    }

    public static void testPoll(MaxHeap maxHeap) {
        int val = maxHeap.poll(); // 堆顶元素出堆
        System.out.format("\n出堆元素为 %d\n", val);
        maxHeap.print();
    }

    public static void main(String[] args) {
        /* 初始化大顶堆 */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\n输入列表并建堆后");
        maxHeap.print();

        /* 获取堆顶元素 */
        int peek = maxHeap.peek();
        System.out.format("\n堆顶元素为 %d\n", peek);

        /* 元素入堆 */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n元素 %d 入堆后\n", val);
        maxHeap.print();

        /* 堆顶元素出堆 */
        peek = maxHeap.poll();
        System.out.format("\n堆顶元素 %d 出堆后\n", peek);
        maxHeap.print();

        /* 获取堆大小 */
        int size = maxHeap.size();
        System.out.format("\n堆元素数量为 %d\n", size);

        /* 判断堆是否为空 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n堆是否为空 %b\n", isEmpty);
    }
}
