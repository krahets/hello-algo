/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* 串列類別 */
class MyList {
    private int[] arr; // 陣列（儲存串列元素）
    private int capacity = 10; // 串列容量
    private int size = 0; // 串列長度（當前元素數量）
    private int extendRatio = 2; // 每次串列擴容的倍數

    /* 建構子 */
    public MyList() {
        arr = new int[capacity];
    }

    /* 獲取串列長度（當前元素數量） */
    public int size() {
        return size;
    }

    /* 獲取串列容量 */
    public int capacity() {
        return capacity;
    }

    /* 訪問元素 */
    public int get(int index) {
        // 索引如果越界，則丟擲異常，下同
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        return arr[index];
    }

    /* 更新元素 */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        arr[index] = num;
    }

    /* 在尾部新增元素 */
    public void add(int num) {
        // 元素數量超出容量時，觸發擴容機制
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // 更新元素數量
        size++;
    }

    /* 在中間插入元素 */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        // 元素數量超出容量時，觸發擴容機制
        if (size == capacity())
            extendCapacity();
        // 將索引 index 以及之後的元素都向後移動一位
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 更新元素數量
        size++;
    }

    /* 刪除元素 */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        int num = arr[index];
        // 將將索引 index 之後的元素都向前移動一位
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 更新元素數量
        size--;
        // 返回被刪除的元素
        return num;
    }

    /* 串列擴容 */
    public void extendCapacity() {
        // 新建一個長度為原陣列 extendRatio 倍的新陣列，並將原陣列複製到新陣列
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // 更新串列容量
        capacity = arr.length;
    }

    /* 將串列轉換為陣列 */
    public int[] toArray() {
        int size = size();
        // 僅轉換有效長度範圍內的串列元素
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* Driver Code */
    public static void main(String[] args) {
        /* 初始化串列 */
        MyList nums = new MyList();
        /* 在尾部新增元素 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("串列 nums = " + Arrays.toString(nums.toArray()) +
                " ，容量 = " + nums.capacity() + " ，長度 = " + nums.size());

        /* 在中間插入元素 */
        nums.insert(3, 6);
        System.out.println("在索引 3 處插入數字 6 ，得到 nums = " + Arrays.toString(nums.toArray()));

        /* 刪除元素 */
        nums.remove(3);
        System.out.println("刪除索引 3 處的元素，得到 nums = " + Arrays.toString(nums.toArray()));

        /* 訪問元素 */
        int num = nums.get(1);
        System.out.println("訪問索引 1 處的元素，得到 num = " + num);

        /* 更新元素 */
        nums.set(1, 0);
        System.out.println("將索引 1 處的元素更新為 0 ，得到 nums = " + Arrays.toString(nums.toArray()));

        /* 測試擴容機制 */
        for (int i = 0; i < 10; i++) {
            // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
            nums.add(i);
        }
        System.out.println("擴容後的串列 nums = " + Arrays.toString(nums.toArray()) +
                " ，容量 = " + nums.capacity() + " ，長度 = " + nums.size());
    }
}
