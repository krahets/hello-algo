/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* 大頂堆積 */
class MaxHeap {
    // 使用串列而非陣列，這樣無須考慮擴容問題
    private List<Integer> maxHeap;

    /* 建構子，根據輸入串列建堆積 */
    public MaxHeap(List<Integer> nums) {
        // 將串列元素原封不動新增進堆積
        maxHeap = new ArrayList<>(nums);
        // 堆積化除葉節點以外的其他所有節點
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 獲取左子節點的索引 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 獲取右子節點的索引 */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 獲取父節點的索引 */
    private int parent(int i) {
        return (i - 1) / 2; // 向下整除
    }

    /* 交換元素 */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* 獲取堆積大小 */
    public int size() {
        return maxHeap.size();
    }

    /* 判斷堆積是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 訪問堆積頂元素 */
    public int peek() {
        return maxHeap.get(0);
    }

    /* 元素入堆積 */
    public void push(int val) {
        // 新增節點
        maxHeap.add(val);
        // 從底至頂堆積化
        siftUp(size() - 1);
    }

    /* 從節點 i 開始，從底至頂堆積化 */
    private void siftUp(int i) {
        while (true) {
            // 獲取節點 i 的父節點
            int p = parent(i);
            // 當“越過根節點”或“節點無須修復”時，結束堆積化
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 交換兩節點
            swap(i, p);
            // 迴圈向上堆積化
            i = p;
        }
    }

    /* 元素出堆積 */
    public int pop() {
        // 判空處理
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        swap(0, size() - 1);
        // 刪除節點
        int val = maxHeap.remove(size() - 1);
        // 從頂至底堆積化
        siftDown(0);
        // 返回堆積頂元素
        return val;
    }

    /* 從節點 i 開始，從頂至底堆積化 */
    private void siftDown(int i) {
        while (true) {
            // 判斷節點 i, l, r 中值最大的節點，記為 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
            if (ma == i)
                break;
            // 交換兩節點
            swap(i, ma);
            // 迴圈向下堆積化
            i = ma;
        }
    }

    /* 列印堆積（二元樹） */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* 初始化大頂堆積 */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\n輸入串列並建堆積後");
        maxHeap.print();

        /* 獲取堆積頂元素 */
        int peek = maxHeap.peek();
        System.out.format("\n堆積頂元素為 %d\n", peek);

        /* 元素入堆積 */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n元素 %d 入堆積後\n", val);
        maxHeap.print();

        /* 堆積頂元素出堆積 */
        peek = maxHeap.pop();
        System.out.format("\n堆積頂元素 %d 出堆積後\n", peek);
        maxHeap.print();

        /* 獲取堆積大小 */
        int size = maxHeap.size();
        System.out.format("\n堆積元素數量為 %d\n", size);

        /* 判斷堆積是否為空 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n堆積是否為空 %b\n", isEmpty);
    }
}
