/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* 列表类简易实现 */
class MyList {
    private int[] nums;           // 数组（存储列表元素）
    private int numsCapacity = 10;    // 列表容量
    private int numsSize = 0;         // 列表长度（即当前元素数量）
    private int extendRatio = 2;  // 每次列表扩容的倍数

    /* 构造方法 */
    public MyList() {
        nums = new int[numsCapacity];
    }

    /* 获取列表长度（即当前元素数量）*/
    public int size() {
        return numsSize;
    }

    /* 获取列表容量 */
    public int capacity() {
        return numsCapacity;
    }

    /* 访问元素 */
    public int get(int index) {
        // 索引如果越界则抛出异常，下同
        if (index < 0 || index >= numsSize)
            throw new IndexOutOfRangeException("索引越界");
        return nums[index];
    }

    /* 更新元素 */
    public void set(int index, int num) {
        if (index < 0 || index >= numsSize)
            throw new IndexOutOfRangeException("索引越界");
        nums[index] = num;
    }

    /* 尾部添加元素 */
    public void add(int num) {
        // 元素数量超出容量时，触发扩容机制
        if (numsSize == numsCapacity)
            extendCapacity();
        nums[numsSize] = num;
        // 更新元素数量
        numsSize++;
    }

    /* 中间插入元素 */
    public void insert(int index, int num) {
        if (index < 0 || index >= numsSize)
            throw new IndexOutOfRangeException("索引越界");
        // 元素数量超出容量时，触发扩容机制
        if (numsSize == numsCapacity)
            extendCapacity();
        // 将索引 index 以及之后的元素都向后移动一位
        for (int j = numsSize - 1; j >= index; j--) {
            nums[j + 1] = nums[j];
        }
        nums[index] = num;
        // 更新元素数量
        numsSize++;
    }

    /* 删除元素 */
    public int remove(int index) {
        if (index < 0 || index >= numsSize)
            throw new IndexOutOfRangeException("索引越界");
        int num = nums[index];
        // 将索引 index 之后的元素都向前移动一位
        for (int j = index; j < numsSize - 1; j++) {
            nums[j] = nums[j + 1];
        }
        // 更新元素数量
        numsSize--;
        // 返回被删除元素
        return num;
    }

    /* 列表扩容 */
    public void extendCapacity() {
        // 新建一个长度为 numsCapacity * extendRatio 的数组，并将原数组拷贝到新数组
        Array.Resize(ref nums, numsCapacity * extendRatio);
        // 更新列表容量
        numsCapacity = nums.Length;
    }

    /* 将列表转换为数组 */
    public int[] toArray() {
        // 仅转换有效长度范围内的列表元素
        int[] nums = new int[numsSize];
        for (int i = 0; i < numsSize; i++) {
            nums[i] = get(i);
        }
        return nums;
    }
}

public class my_list {
    [Test]
    public void Test() {
        /* 初始化列表 */
        MyList list = new MyList();
        /* 尾部添加元素 */
        list.add(1);
        list.add(3);
        list.add(2);
        list.add(5);
        list.add(4);
        Console.WriteLine("列表 list = " + string.Join(",", list.toArray()) +
                           " ，容量 = " + list.capacity() + " ，长度 = " + list.size());

        /* 中间插入元素 */
        list.insert(3, 6);
        Console.WriteLine("在索引 3 处插入数字 6 ，得到 list = " + string.Join(",", list.toArray()));

        /* 删除元素 */
        list.remove(3);
        Console.WriteLine("删除索引 3 处的元素，得到 list = " + string.Join(",", list.toArray()));

        /* 访问元素 */
        int num = list.get(1);
        Console.WriteLine("访问索引 1 处的元素，得到 num = " + num);

        /* 更新元素 */
        list.set(1, 0);
        Console.WriteLine("将索引 1 处的元素更新为 0 ，得到 list = " + string.Join(",", list.toArray()));

        /* 测试扩容机制 */
        for (int i = 0; i < 10; i++) {
            // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
            list.add(i);
        }
        Console.WriteLine("扩容后的列表 list = " + string.Join(",", list.toArray()) +
                           " ，容量 = " + list.capacity() + " ，长度 = " + list.size());
    }
}
