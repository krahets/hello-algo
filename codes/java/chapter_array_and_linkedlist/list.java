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
        // 注意数组的元素类型是 int[] 的包装类 Integer[]
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("列表 nums = " + nums);

        /* 访问元素 */
        int num = nums.get(1);
        System.out.println("访问索引 1 处的元素，得到 num = " + num);

        /* 更新元素 */
        nums.set(1, 0);
        System.out.println("将索引 1 处的元素更新为 0 ，得到 nums = " + nums);

        /* 清空列表 */
        nums.clear();
        System.out.println("清空列表后 nums = " + nums);

        /* 在尾部添加元素 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("添加元素后 nums = " + nums);

        /* 在中间插入元素 */
        nums.add(3, 6);
        System.out.println("在索引 3 处插入数字 6 ，得到 nums = " + nums);

        /* 删除元素 */
        nums.remove(3);
        System.out.println("删除索引 3 处的元素，得到 nums = " + nums);

        /* 通过索引遍历列表 */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* 直接遍历列表元素 */
        for (int x : nums) {
            count += x;
        }

        /* 拼接两个列表 */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("将列表 nums1 拼接到 nums 之后，得到 nums = " + nums);

        /* 排序列表 */
        Collections.sort(nums);
        System.out.println("排序列表后 nums = " + nums);
    }
}
