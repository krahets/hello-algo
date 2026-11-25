/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* 列表類別 */
class MyList {
    private int[] arr; // 陣列（用來儲存列表元素）
    private int capacity = 10; // 列表容量
    private int size = 0; // 列表長度（目前的元素數量）
    private int extendRatio = 2; // 每次擴充列表容量的倍數

    /* 建構方法 */
    public MyList() {
        arr = new int[capacity];
    }

    /* 取得列表長度（目前的元素數量） */
    public int size() {
        return size;
    }

    /* 取得列表容量 */
    public int capacity() {
        return capacity;
    }

    /* 存取元素 */
    public int get(int index) {
        // 若索引超出範圍，就拋出例外，以下同理
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引超出範圍");
        return arr[index];
    }

    /* 更新元素 */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引超出範圍");
        arr[index] = num;
    }

    /* 在尾端加入元素 */
    public void add(int num) {
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // 更新元素數量
        size++;
    }

    /* 在中間插入元素 */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引超出範圍");
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if (size == capacity())
            extendCapacity();
        // 將索引 index 起的所有元素往後移一格
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
            throw new IndexOutOfBoundsException("索引超出範圍");
        int num = arr[index];
        // 將索引 index 之後的所有元素往前移一格
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 更新元素數量
        size--;
        // 回傳刪除的元素
        return num;
    }

    /* 擴充列表容量 */
    public void extendCapacity() {
        // 建立長度為原陣列 extendRatio 倍的新陣列，並將原陣列的內容複製過去
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // 更新列表容量
        capacity = arr.length;
    }

    /* 將列表轉為陣列 */
    public int[] toArray() {
        int size = size();
        // 僅轉換列表有效長度範圍內的元素
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* 範例主程式 */
    public static void main(String[] args) {
        /* 初始化列表 */
        MyList nums = new MyList();
        /* 在尾端加入元素 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("列表 nums = " + Arrays.toString(nums.toArray()) +
                " ，容量 = " + nums.capacity() + " ，長度 = " + nums.size());

        /* 在中間插入元素 */
        nums.insert(3, 6);
        System.out.println("在索引 3 處插入數字 6，得到 nums = " + Arrays.toString(nums.toArray()));

        /* 刪除元素 */
        nums.remove(3);
        System.out.println("刪除索引 3 處的元素，得到 nums = " + Arrays.toString(nums.toArray()));

        /* 存取元素 */
        int num = nums.get(1);
        System.out.println("存取索引 1 處的元素，得到 num = " + num);

        /* 更新元素 */
        nums.set(1, 0);
        System.out.println("將索引 1 處的元素更新為 0，得到 nums = " + Arrays.toString(nums.toArray()));

        /* 測試容量擴充機制 */
        for (int i = 0; i < 10; i++) {
            // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
            nums.add(i);
        }
        System.out.println("擴充後的列表 nums = " + Arrays.toString(nums.toArray()) +
                " ，容量 = " + nums.capacity() + " ，長度 = " + nums.size());
    }
}
