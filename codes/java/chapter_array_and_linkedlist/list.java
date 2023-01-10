/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* 初始化列表 */
        // 注意数组的元素类型是 int[] 的包装类 Integer[]
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> list = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("列表 list = " + list);

        /* 访问元素 */
        int num = list.get(1);
        System.out.println("访问索引 1 处的元素，得到 num = " + num);

        /* 更新元素 */
        list.set(1, 0);
        System.out.println("将索引 1 处的元素更新为 0 ，得到 list = " + list);

        /* 清空列表 */
        list.clear();
        System.out.println("清空列表后 list = " + list);

        /* 尾部添加元素 */
        list.add(1);
        list.add(3);
        list.add(2);
        list.add(5);
        list.add(4);
        System.out.println("添加元素后 list = " + list);

        /* 中间插入元素 */
        list.add(3, 6);
        System.out.println("在索引 3 处插入数字 6 ，得到 list = " + list);

        /* 删除元素 */
        list.remove(3);
        System.out.println("删除索引 3 处的元素，得到 list = " + list);

        /* 通过索引遍历列表 */
        int count = 0;
        for (int i = 0; i < list.size(); i++) {
            count++;
        }

        /* 直接遍历列表元素 */
        count = 0;
        for (int n : list) {
            count++;
        }

        /* 拼接两个列表 */
        List<Integer> list1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        list.addAll(list1);
        System.out.println("将列表 list1 拼接到 list 之后，得到 list = " + list);

        /* 排序列表 */
        Collections.sort(list);
        System.out.println("排序列表后 list = " + list);
    }
}
