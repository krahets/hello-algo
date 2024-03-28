/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* 大頂堆積 */
class MaxHeap {
    // 使用串列而非陣列，這樣無須考慮擴容問題
    List<int> maxHeap;

    /* 建構子，建立空堆積 */
    public MaxHeap() {
        maxHeap = [];
    }

    /* 建構子，根據輸入串列建堆積 */
    public MaxHeap(IEnumerable<int> nums) {
        // 將串列元素原封不動新增進堆積
        maxHeap = new List<int>(nums);
        // 堆積化除葉節點以外的其他所有節點
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* 獲取左子節點的索引 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 獲取右子節點的索引 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 獲取父節點的索引 */
    int Parent(int i) {
        return (i - 1) / 2; // 向下整除
    }

    /* 訪問堆積頂元素 */
    public int Peek() {
        return maxHeap[0];
    }

    /* 元素入堆積 */
    public void Push(int val) {
        // 新增節點
        maxHeap.Add(val);
        // 從底至頂堆積化
        SiftUp(Size() - 1);
    }

    /* 獲取堆積大小 */
    public int Size() {
        return maxHeap.Count;
    }

    /* 判斷堆積是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 從節點 i 開始，從底至頂堆積化 */
    void SiftUp(int i) {
        while (true) {
            // 獲取節點 i 的父節點
            int p = Parent(i);
            // 若“越過根節點”或“節點無須修復”，則結束堆積化
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交換兩節點
            Swap(i, p);
            // 迴圈向上堆積化
            i = p;
        }
    }

    /* 元素出堆積 */
    public int Pop() {
        // 判空處理
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        Swap(0, Size() - 1);
        // 刪除節點
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 從頂至底堆積化
        SiftDown(0);
        // 返回堆積頂元素
        return val;
    }

    /* 從節點 i 開始，從頂至底堆積化 */
    void SiftDown(int i) {
        while (true) {
            // 判斷節點 i, l, r 中值最大的節點，記為 ma
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若“節點 i 最大”或“越過葉節點”，則結束堆積化
            if (ma == i) break;
            // 交換兩節點
            Swap(i, ma);
            // 迴圈向下堆積化
            i = ma;
        }
    }

    /* 交換元素 */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* 列印堆積（二元樹） */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* 初始化大頂堆積 */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\n輸入串列並建堆積後");
        maxHeap.Print();

        /* 獲取堆積頂元素 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"堆積頂元素為 {peek}");

        /* 元素入堆積 */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"元素 {val} 入堆積後");
        maxHeap.Print();

        /* 堆積頂元素出堆積 */
        peek = maxHeap.Pop();
        Console.WriteLine($"堆積頂元素 {peek} 出堆積後");
        maxHeap.Print();

        /* 獲取堆積大小 */
        int size = maxHeap.Size();
        Console.WriteLine($"堆積元素數量為 {size}");

        /* 判斷堆積是否為空 */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"堆積是否為空 {isEmpty}");
    }
}
