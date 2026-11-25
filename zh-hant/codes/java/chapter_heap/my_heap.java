/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* 最大堆積 */
class MaxHeap {
    // 採用可擴充的串列取代陣列，無須自行處理擴充容量的問題
    private List<Integer> maxHeap;

    /* 建構式，根據輸入串列建立堆積 */
    public MaxHeap(List<Integer> nums) {
        // 將串列元素依原順序全部加入堆積
        maxHeap = new ArrayList<>(nums);
        // 從每個非葉節點向下調整堆積
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 取得左子節點的索引 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    private int parent(int i) {
        return (i - 1) / 2; // 向下取整的整數除法
    }

    /* 交換元素 */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* 取得堆積大小 */
    public int size() {
        return maxHeap.size();
    }

    /* 判斷堆積是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 讀取堆積頂端元素 */
    public int peek() {
        return maxHeap.get(0);
    }

    /* 將元素加入堆積 */
    public void push(int val) {
        // 新增節點
        maxHeap.add(val);
        // 由下往上調整堆積
        siftUp(size() - 1);
    }

    /* 從節點 i 開始向上調整堆積 */
    private void siftUp(int i) {
        while (true) {
            // 取得節點 i 的父節點
            int p = parent(i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 交換兩個節點
            swap(i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }

    /* 從堆積取出元素 */
    public int pop() {
        // 檢查堆積是否為空
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        swap(0, size() - 1);
        // 刪除節點
        int val = maxHeap.remove(size() - 1);
        // 由上往下調整堆積
        siftDown(0);
        // 回傳堆積頂端元素
        return val;
    }

    /* 從節點 i 開始向下調整堆積 */
    private void siftDown(int i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
            if (ma == i)
                break;
            // 交換兩個節點
            swap(i, ma);
            // 繼續向下調整堆積
            i = ma;
        }
    }

    /* 印出堆積（二元樹） */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* 初始化最大堆積 */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\n用輸入串列建立堆積後");
        maxHeap.print();

        /* 取得堆積頂端元素 */
        int peek = maxHeap.peek();
        System.out.format("\n堆積頂端元素為 %d\n", peek);

        /* 將元素加入堆積 */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n將元素 %d 加入堆積後\n", val);
        maxHeap.print();

        /* 取出堆積頂端元素 */
        peek = maxHeap.pop();
        System.out.format("\n取出堆積頂端元素 %d 後\n", peek);
        maxHeap.print();

        /* 取得堆積大小 */
        int size = maxHeap.size();
        System.out.format("\n堆積中的元素個數為 %d\n", size);

        /* 判斷堆積是否為空 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n堆積是否為空 %b\n", isEmpty);
    }
}
