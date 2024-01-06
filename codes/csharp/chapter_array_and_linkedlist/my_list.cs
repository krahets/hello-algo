/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* 列表类 */
class MyList {
    private int[] arr;           // 数组（存储列表元素）
    private int arrCapacity = 10;    // 列表容量
    private int arrSize = 0;         // 列表长度（当前元素数量）
    private readonly int extendRatio = 2;  // 每次列表扩容的倍数

    /* 构造方法 */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* 获取列表长度（当前元素数量）*/
    public int Size() {
        return arrSize;
    }

    /* 获取列表容量 */
    public int Capacity() {
        return arrCapacity;
    }

    /* 访问元素 */
    public int Get(int index) {
        // 索引如果越界，则抛出异常，下同
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

    /* 在尾部添加元素 */
    public void Add(int num) {
        // 元素数量超出容量时，触发扩容机制
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // 更新元素数量
        arrSize++;
    }

    /* 在中间插入元素 */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("索引越界");
        // 元素数量超出容量时，触发扩容机制
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // 将索引 index 以及之后的元素都向后移动一位
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 更新元素数量
        arrSize++;
    }

    /* 删除元素 */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("索引越界");
        int num = arr[index];
        // 将将索引 index 之后的元素都向前移动一位
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 更新元素数量
        arrSize--;
        // 返回被删除的元素
        return num;
    }

    /* 列表扩容 */
    public void ExtendCapacity() {
        // 新建一个长度为 arrCapacity * extendRatio 的数组，并将原数组复制到新数组
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // 更新列表容量
        arrCapacity = arr.Length;
    }

    /* 将列表转换为数组 */
    public int[] ToArray() {
        // 仅转换有效长度范围内的列表元素
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
        /* 在尾部添加元素 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("列表 nums = " + string.Join(",", nums.ToArray()) +
                           " ，容量 = " + nums.Capacity() + " ，长度 = " + nums.Size());

        /* 在中间插入元素 */
        nums.Insert(3, 6);
        Console.WriteLine("在索引 3 处插入数字 6 ，得到 nums = " + string.Join(",", nums.ToArray()));

        /* 删除元素 */
        nums.Remove(3);
        Console.WriteLine("删除索引 3 处的元素，得到 nums = " + string.Join(",", nums.ToArray()));

        /* 访问元素 */
        int num = nums.Get(1);
        Console.WriteLine("访问索引 1 处的元素，得到 num = " + num);

        /* 更新元素 */
        nums.Set(1, 0);
        Console.WriteLine("将索引 1 处的元素更新为 0 ，得到 nums = " + string.Join(",", nums.ToArray()));

        /* 测试扩容机制 */
        for (int i = 0; i < 10; i++) {
            // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
            nums.Add(i);
        }
        Console.WriteLine("扩容后的列表 nums = " + string.Join(",", nums.ToArray()) +
                           " ，容量 = " + nums.Capacity() + " ，长度 = " + nums.Size());
    }
}
