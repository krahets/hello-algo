/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: Krahets (krahets@163.com)
 */

package chapter_heap;

import include.*;
import java.util.*;

class MaxHeap {
    private List<Integer> heap;

    public MaxHeap() {
        heap = new ArrayList<>();
    }

    public MaxHeap(List<Integer> nums) {
        // 将元素拷贝至堆中
        heap = new ArrayList<>(nums);
        // 堆化除叶结点外的其他所有结点
        for (int i = parent(size() - 1); i >= 0; i--) {
            heapify(i);
        }
    }

    /* 获取左子结点 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 获取右子结点 */
    private int right(int i) {
        return 2 * i + 2;
    }
    
    /* 获取父结点 */
    private int parent(int i) {
        return (i - 1) / 2;
    }

    /* 交换元素 */
    private void swap(int i, int j) {
        int tmp = heap.get(i);
        heap.set(i, j);
        heap.set(j, tmp);
    }

    public int size() {
        return heap.size();
    }

    public boolean isEmpty() {
        return size() == 0;
    }

    /* 获取堆顶元素 */
    public int peek() {
        return heap.get(0);
    }

    /* 元素入堆 */
    public void push(int val) {
        heap.add(val);

        // 从底至顶堆化
        int i = size();
        while (true) {
            int p = parent(i);
            if (p < 0 || heap.get(i) > heap.get(p))
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
        int val = heap.remove(size() - 1);
        // 从顶至底堆化
        heapify(0);
        // 返回堆顶元素
        return val;
    }

    /* 从结点 i 开始，从顶至底堆化 */
    private void heapify(int i) {
        while (true) {
            // 判断结点 i, l, r 中的最大结点，记为 ma ；
            int l = left(i), r = right(i), ma = i;
            if (heap.get(l) > heap.get(ma)) ma = l;
            if (heap.get(r) > heap.get(ma)) ma = r;
            // 若结点 i 最大，则无需继续堆化，跳出
            if (ma == i) break;
            // 交换结点 i 与结点 max
            swap(i, ma);
            // 循环向下堆化
            i = ma;
        }
    }
}


public class my_heap {
    public static void main(String[] args) {

    }
}
