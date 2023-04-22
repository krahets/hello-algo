/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* 列表类简易实现 */
class MyList {
    private int[] nums; // 数组（存储列表元素）
    private int capacity = 10; // 列表容量
    private int size = 0; // 列表长度（即当前元素数量）
    private int extendRatio = 2; // 每次列表扩容的倍数

    /* 构造方法 */
    public MyList() {
        nums = new int[capacity];
    }

    /* 获取列表长度（即当前元素数量） */
    public int size() {
        return size;
    }

    /* 获取列表容量 */
    public int capacity() {
        return capacity;
    }

    /* 访问元素 */
    public int get(int index) {
        // 索引如果越界则抛出异常，下同
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        return nums[index];
    }

    /* 更新元素 */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        nums[index] = num;
    }

    /* 尾部添加元素 */
    public void add(int num) {
        // 元素数量超出容量时，触发扩容机制
        if (size == capacity())
            extendCapacity();
        nums[size] = num;
        // 更新元素数量
        size++;
    }

    /* 中间插入元素 */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        // 元素数量超出容量时，触发扩容机制
        if (size == capacity())
            extendCapacity();
        // 将索引 index 以及之后的元素都向后移动一位
        for (int j = size - 1; j >= index; j--) {
            nums[j + 1] = nums[j];
        }
        nums[index] = num;
        // 更新元素数量
        size++;
    }

    /* 删除元素 */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        int num = nums[index];
        // 将索引 index 之后的元素都向前移动一位
        for (int j = index; j < size - 1; j++) {
            nums[j] = nums[j + 1];
        }
        // 更新元素数量
        size--;
        // 返回被删除元素
        return num;
    }

    /* 列表扩容 */
    public void extendCapacity() {
        // 新建一个长度为 size 的数组，并将原数组拷贝到新数组
        nums = Arrays.copyOf(nums, capacity() * extendRatio);
        // 更新列表容量
        capacity = nums.length;
    }

    /* 将列表转换为数组 */
    public int[] toArray() {
        int size = size();
        // 仅转换有效长度范围内的列表元素
        int[] nums = new int[size];
        for (int i = 0; i < size; i++) {
            nums[i] = get(i);
        }
        return nums;
    }
}

public class my_list {
    /* Driver Code */
    public static void main(String[] args) {
        /* 初始化列表 */
        MyList list = new MyList();
        /* 尾部添加元素 */
        list.add(1);
        list.add(3);
        list.add(2);
        list.add(5);
        list.add(4);
        System.out.println("列表 list = " + Arrays.toString(list.toArray()) +
                " ，容量 = " + list.capacity() + " ，长度 = " + list.size());

        /* 中间插入元素 */
        list.insert(3, 6);
        System.out.println("在索引 3 处插入数字 6 ，得到 list = " + Arrays.toString(list.toArray()));

        /* 删除元素 */
        list.remove(3);
        System.out.println("删除索引 3 处的元素，得到 list = " + Arrays.toString(list.toArray()));

        /* 访问元素 */
        int num = list.get(1);
        System.out.println("访问索引 1 处的元素，得到 num = " + num);

        /* 更新元素 */
        list.set(1, 0);
        System.out.println("将索引 1 处的元素更新为 0 ，得到 list = " + Arrays.toString(list.toArray()));

        /* 测试扩容机制 */
        for (int i = 0; i < 10; i++) {
            // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
            list.add(i);
        }
        System.out.println("扩容后的列表 list = " + Arrays.toString(list.toArray()) +
                " ，容量 = " + list.capacity() + " ，长度 = " + list.size());
    }
}
