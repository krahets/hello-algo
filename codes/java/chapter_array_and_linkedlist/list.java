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

        // [region]{access_element}
        /* 访问元素 */
        int num = nums.get(1); // 访问索引 1 处的元素
        // [endregion]{access_element}
        System.out.println("访问索引 1 处的元素，得到 num = " + num);

        // [region]{update_element}
        /* 更新元素 */
        nums.set(1, 0); // 将索引 1 处的元素更新为 0
        // [endregion]{update_element}
        System.out.println("将索引 1 处的元素更新为 0 ，得到 nums = " + nums);

        // [region]{clear_list}
        /* 清空列表 */
        nums.clear();
        // [endregion]{clear_list}
        System.out.println("清空列表后 nums = " + nums);

        // [region]{append_element}
        /* 在尾部添加元素 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        // [endregion]{append_element}
        System.out.println("添加元素后 nums = " + nums);

        // [region]{insert_element}
        /* 在中间插入元素 */
        nums.add(3, 6); // 在索引 3 处插入数字 6
        // [endregion]{insert_element}
        System.out.println("在索引 3 处插入数字 6 ，得到 nums = " + nums);

        // [region]{remove_element}
        /* 删除元素 */
        nums.remove(3); // 删除索引 3 处的元素
        // [endregion]{remove_element}
        System.out.println("删除索引 3 处的元素，得到 nums = " + nums);

        // [region]{iterate_list}
        /* 通过索引遍历列表 */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }

        /* 直接遍历列表元素 */
        for (int x : nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* 拼接两个列表 */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1); // 将列表 nums1 拼接到 nums 之后
        // [endregion]{concat_list}
        System.out.println("将列表 nums1 拼接到 nums 之后，得到 nums = " + nums);

        // [region]{sort_list}
        /* 排序列表 */
        Collections.sort(nums); // 排序后，列表元素从小到大排列
        // [endregion]{sort_list}
        System.out.println("排序列表后 nums = " + nums);
    }
}
