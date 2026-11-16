/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        // [region]{init_list}
        /* 初始化串列 */
        // 無初始值
        List<Integer> emptyNums = new ArrayList<>();
        // 有初始值（注意陣列型別需為 Integer[] 而非 int[]，因為串列元素只能是 int 的包裝類別 Integer）
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        // [endregion]{init_list}
        System.out.println("串列 nums = " + nums);
        System.out.println("串列 emptyNums = " + emptyNums);

        // [region]{access_element}
        /* 訪問元素 */
        int num = nums.get(1); // 訪問索引 1 處的元素
        // [endregion]{access_element}
        System.out.println("訪問索引 1 處的元素，得到 num = " + num);

        // [region]{update_element}
        /* 更新元素 */
        nums.set(1, 0); // 將索引 1 處的元素更新為 0
        // [endregion]{update_element}
        System.out.println("將索引 1 處的元素更新為 0 ，得到 nums = " + nums);

        // [region]{clear_list}
        /* 清空串列 */
        nums.clear();
        // [endregion]{clear_list}
        System.out.println("清空串列後 nums = " + nums);

        // [region]{append_element}
        /* 在尾部新增元素 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        // [endregion]{append_element}
        System.out.println("新增元素後 nums = " + nums);

        // [region]{insert_element}
        /* 在中間插入元素 */
        nums.add(3, 6); // 在索引 3 處插入數字 6
        // [endregion]{insert_element}
        System.out.println("在索引 3 處插入數字 6 ，得到 nums = " + nums);

        // [region]{remove_element}
        /* 刪除元素 */
        nums.remove(3); // 刪除索引 3 處的元素
        // [endregion]{remove_element}
        System.out.println("刪除索引 3 處的元素，得到 nums = " + nums);

        // [region]{iterate_list}
        /* 透過索引走訪串列 */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }

        /* 直接走訪串列元素 */
        for (int x : nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* 拼接兩個串列 */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1); // 將串列 nums1 拼接到 nums 之後
        // [endregion]{concat_list}
        System.out.println("將串列 nums1 拼接到 nums 之後，得到 nums = " + nums);

        // [region]{sort_list}
        /* 排序串列 */
        Collections.sort(nums); // 排序後，串列元素從小到大排列
        // [endregion]{sort_list}
        System.out.println("排序串列後 nums = " + nums);
    }
}
