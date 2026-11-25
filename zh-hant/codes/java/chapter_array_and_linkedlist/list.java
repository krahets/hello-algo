/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* 初始化列表 */
        // 注意，陣列型別應為 Integer[] 而非 int[]，因為列表中的 int 元素必須使用其包裝類別 Integer
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("列表 nums = " + nums);

        /* 存取元素 */
        int num = nums.get(1);
        System.out.println("存取索引 1 處的元素，得到 num = " + num);

        /* 更新元素 */
        nums.set(1, 0);
        System.out.println("將索引 1 處的元素更新為 0，得到 nums = " + nums);

        /* 清空列表 */
        nums.clear();
        System.out.println("清空列表後，nums = " + nums);

        /* 在尾端加入元素 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("加入元素後，nums = " + nums);

        /* 在中間插入元素 */
        nums.add(3, 6);
        System.out.println("在索引 3 處插入數字 6，得到 nums = " + nums);

        /* 刪除元素 */
        nums.remove(3);
        System.out.println("刪除索引 3 處的元素，得到 nums = " + nums);

        /* 依索引走訪列表 */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* 直接走訪列表中的元素 */
        for (int x : nums) {
            count += x;
        }

        /* 串接兩個列表 */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("將列表 nums1 接在 nums 之後，得到 nums = " + nums);

        /* 排序列表 */
        Collections.sort(nums);
        System.out.println("列表排序後，nums = " + nums);
    }
}
