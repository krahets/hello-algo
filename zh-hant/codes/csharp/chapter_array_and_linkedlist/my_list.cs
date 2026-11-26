/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* 列表類別 */
class MyList {
    private int[] arr;           // 陣列（用來儲存列表元素）
    private int arrCapacity = 10;    // 列表容量
    private int arrSize = 0;         // 列表長度（目前的元素數量）
    private readonly int extendRatio = 2;  // 每次擴充列表容量的倍數

    /* 建構方法 */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* 取得列表長度（目前的元素數量）*/
    public int Size() {
        return arrSize;
    }

    /* 取得列表容量 */
    public int Capacity() {
        return arrCapacity;
    }

    /* 存取元素 */
    public int Get(int index) {
        // 若索引超出範圍，就拋出例外，以下同理
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("索引超出範圍");
        return arr[index];
    }

    /* 更新元素 */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("索引超出範圍");
        arr[index] = num;
    }

    /* 在尾端加入元素 */
    public void Add(int num) {
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // 更新元素數量
        arrSize++;
    }

    /* 在中間插入元素 */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("索引超出範圍");
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // 將索引 index 起的所有元素往後移一格
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
            throw new IndexOutOfRangeException("索引超出範圍");
        int num = arr[index];
        // 將索引 index 之後的所有元素往前移一格
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 更新元素數量
        arrSize--;
        // 回傳刪除的元素
        return num;
    }

    /* 擴充列表容量 */
    public void ExtendCapacity() {
        // 建立長度為 arrCapacity * extendRatio 的陣列，並將原陣列的內容複製過去
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // 更新列表容量
        arrCapacity = arr.Length;
    }

    /* 將列表轉為陣列 */
    public int[] ToArray() {
        // 僅轉換列表有效長度範圍內的元素
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
        /* 初始化列表 */
        MyList nums = new();
        /* 在尾端加入元素 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("列表 nums = " + string.Join(",", nums.ToArray()) +
                           " ，容量 = " + nums.Capacity() + " ，長度 = " + nums.Size());

        /* 在中間插入元素 */
        nums.Insert(3, 6);
        Console.WriteLine("在索引 3 處插入數字 6，得到 nums = " + string.Join(",", nums.ToArray()));

        /* 刪除元素 */
        nums.Remove(3);
        Console.WriteLine("刪除索引 3 處的元素，得到 nums = " + string.Join(",", nums.ToArray()));

        /* 存取元素 */
        int num = nums.Get(1);
        Console.WriteLine("存取索引 1 處的元素，得到 num = " + num);

        /* 更新元素 */
        nums.Set(1, 0);
        Console.WriteLine("將索引 1 處的元素更新為 0，得到 nums = " + string.Join(",", nums.ToArray()));

        /* 測試容量擴充機制 */
        for (int i = 0; i < 10; i++) {
            // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
            nums.Add(i);
        }
        Console.WriteLine("擴充後的列表 nums = " + string.Join(",", nums.ToArray()) +
                           " ，容量 = " + nums.Capacity() + " ，長度 = " + nums.Size());
    }
}
