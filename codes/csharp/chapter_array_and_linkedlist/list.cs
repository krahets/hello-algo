/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* 初始化列表 */
        int[] numbers = new int[] { 1, 3, 2, 5, 4 };
        List<int> list = numbers.ToList();
        Console.WriteLine("列表 list = " + string.Join(",", list));

        /* 访问元素 */
        int num = list[1];
        Console.WriteLine("访问索引 1 处的元素，得到 num = " + num);

        /* 更新元素 */
        list[1] = 0;
        Console.WriteLine("将索引 1 处的元素更新为 0 ，得到 list = " + string.Join(",", list));

        /* 清空列表 */
        list.Clear();
        Console.WriteLine("清空列表后 list = " + string.Join(",", list));

        /* 尾部添加元素 */
        list.Add(1);
        list.Add(3);
        list.Add(2);
        list.Add(5);
        list.Add(4);
        Console.WriteLine("添加元素后 list = " + string.Join(",", list));

        /* 中间插入元素 */
        list.Insert(3, 6);
        Console.WriteLine("在索引 3 处插入数字 6 ，得到 list = " + string.Join(",", list));

        /* 删除元素 */
        list.RemoveAt(3);
        Console.WriteLine("删除索引 3 处的元素，得到 list = " + string.Join(",", list));

        /* 通过索引遍历列表 */
        int count = 0;
        for (int i = 0; i < list.Count; i++) {
            count++;
        }

        /* 直接遍历列表元素 */
        count = 0;
        foreach (int n in list) {
            count++;
        }

        /* 拼接两个列表 */
        List<int> list1 = new() { 6, 8, 7, 10, 9 };
        list.AddRange(list1);
        Console.WriteLine("将列表 list1 拼接到 list 之后，得到 list = " + string.Join(",", list));

        /* 排序列表 */
        list.Sort(); // 排序后，列表元素从小到大排列
        Console.WriteLine("排序列表后 list = " + string.Join(",", list));
    }
}
