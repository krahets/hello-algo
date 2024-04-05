/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* 串列類別 */
class MyList {
    private int[] arr;           // 陣列（儲存串列元素）
    private int arrCapacity = 10;    // 串列容量
    private int arrSize = 0;         // 串列長度（當前元素數量）
    private readonly int extendRatio = 2;  // 每次串列擴容的倍數

    /* 建構子 */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* 獲取串列長度（當前元素數量）*/
    public int Size() {
        return arrSize;
    }

    /* 獲取串列容量 */
    public int Capacity() {
        return arrCapacity;
    }

    /* 訪問元素 */
    public int Get(int index) {
        // 索引如果越界，則丟擲異常，下同
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("索引越界");
        return arr[index];
    }

    /* 更新元素 */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("索引越界");
        arr[index] = num;
    }

    /* 在尾部新增元素 */
    public void Add(int num) {
        // 元素數量超出容量時，觸發擴容機制
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // 更新元素數量
        arrSize++;
    }

    /* 在中間插入元素 */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("索引越界");
        // 元素數量超出容量時，觸發擴容機制
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // 將索引 index 以及之後的元素都向後移動一位
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 更新元素數量
        arrSize++;
    }

    /* 刪除元素 */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("索引越界");
        int num = arr[index];
        // 將將索引 index 之後的元素都向前移動一位
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 更新元素數量
        arrSize--;
        // 返回被刪除的元素
        return num;
    }

    /* 串列擴容 */
    public void ExtendCapacity() {
        // 新建一個長度為 arrCapacity * extendRatio 的陣列，並將原陣列複製到新陣列
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // 更新串列容量
        arrCapacity = arr.Length;
    }

    /* 將串列轉換為陣列 */
    public int[] ToArray() {
        // 僅轉換有效長度範圍內的串列元素
        int[] arr = new int[arrSize];
        for (int i = 0; i < arrSize; i++) {
            arr[i] = Get(i);
        }
        return arr;
    }
}

public class my_list {
    [Test]
    public void Test() {
        /* 初始化串列 */
        MyList nums = new();
        /* 在尾部新增元素 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("串列 nums = " + string.Join(",", nums.ToArray()) +
                           " ，容量 = " + nums.Capacity() + " ，長度 = " + nums.Size());

        /* 在中間插入元素 */
        nums.Insert(3, 6);
        Console.WriteLine("在索引 3 處插入數字 6 ，得到 nums = " + string.Join(",", nums.ToArray()));

        /* 刪除元素 */
        nums.Remove(3);
        Console.WriteLine("刪除索引 3 處的元素，得到 nums = " + string.Join(",", nums.ToArray()));

        /* 訪問元素 */
        int num = nums.Get(1);
        Console.WriteLine("訪問索引 1 處的元素，得到 num = " + num);

        /* 更新元素 */
        nums.Set(1, 0);
        Console.WriteLine("將索引 1 處的元素更新為 0 ，得到 nums = " + string.Join(",", nums.ToArray()));

        /* 測試擴容機制 */
        for (int i = 0; i < 10; i++) {
            // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
            nums.Add(i);
        }
        Console.WriteLine("擴容後的串列 nums = " + string.Join(",", nums.ToArray()) +
                           " ，容量 = " + nums.Capacity() + " ，長度 = " + nums.Size());
    }
}
