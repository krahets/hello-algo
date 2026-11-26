/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* 最大堆積 */
class MaxHeap {
    // 採用可擴充的串列取代陣列，無須自行處理擴充容量的問題
    List<int> maxHeap;

    /* 建構函式，建立空堆積 */
    public MaxHeap() {
        maxHeap = [];
    }

    /* 建構函式，根據輸入串列建立堆積 */
    public MaxHeap(IEnumerable<int> nums) {
        // 將串列元素依原順序全部加入堆積
        maxHeap = new List<int>(nums);
        // 從每個非葉節點向下調整堆積
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* 取得左子節點的索引 */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* 取得右子節點的索引 */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* 取得父節點的索引 */
    int Parent(int i) {
        return (i - 1) / 2; // 向下取整的整數除法
    }

    /* 讀取堆積頂端元素 */
    public int Peek() {
        return maxHeap[0];
    }

    /* 將元素加入堆積 */
    public void Push(int val) {
        // 新增節點
        maxHeap.Add(val);
        // 由下往上調整堆積
        SiftUp(Size() - 1);
    }

    /* 取得堆積大小 */
    public int Size() {
        return maxHeap.Count;
    }

    /* 判斷堆積是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 從節點 i 開始向上調整堆積 */
    void SiftUp(int i) {
        while (true) {
            // 取得節點 i 的父節點
            int p = Parent(i);
            // 若已越過根節點，或節點已符合堆積性質，就結束調整
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 交換兩個節點
            Swap(i, p);
            // 繼續向上調整堆積
            i = p;
        }
    }

    /* 從堆積取出元素 */
    public int Pop() {
        // 檢查堆積是否為空
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // 交換根節點與最右側的葉節點（即首尾兩個元素）
        Swap(0, Size() - 1);
        // 刪除節點
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // 由上往下調整堆積
        SiftDown(0);
        // 回傳堆積頂端元素
        return val;
    }

    /* 從節點 i 開始向下調整堆積 */
    void SiftDown(int i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // 若節點 i 的值最大，或已越過葉節點，就結束調整
            if (ma == i) break;
            // 交換兩個節點
            Swap(i, ma);
            // 繼續向下調整堆積
            i = ma;
        }
    }

    /* 交換元素 */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* 印出堆積（二元樹） */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* 初始化最大堆積 */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\n用輸入串列建立堆積後");
        maxHeap.Print();

        /* 取得堆積頂端元素 */
        int peek = maxHeap.Peek();
        Console.WriteLine($"堆積頂端元素為 {peek}");

        /* 將元素加入堆積 */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"將元素 {val} 加入堆積後");
        maxHeap.Print();

        /* 取出堆積頂端元素 */
        peek = maxHeap.Pop();
        Console.WriteLine($"取出堆積頂端元素 {peek} 後");
        maxHeap.Print();

        /* 取得堆積大小 */
        int size = maxHeap.Size();
        Console.WriteLine($"堆積中的元素個數為 {size}");

        /* 判斷堆積是否為空 */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"堆積是否為空 {isEmpty}");
    }
}
