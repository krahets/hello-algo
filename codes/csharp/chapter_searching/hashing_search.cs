/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

using hello_algo.include;
using NUnit.Framework;

namespace hello_algo.chapter_searching
{
    public class hashing_search
    {
        /* 哈希查找（数组） */
        static int hashingSearch(Dictionary<int, int> map, int target)
        {
            // 哈希表的 key: 目标元素，value: 索引
            // 若哈希表中无此 key ，返回 -1
            return map.GetValueOrDefault(target, -1);
        }

        /* 哈希查找（链表） */
        static ListNode? hashingSearch1(Dictionary<int, ListNode> map, int target)
        {

            // 哈希表的 key: 目标结点值，value: 结点对象
            // 若哈希表中无此 key ，返回 null
            return map.GetValueOrDefault(target);
        }

        [Test]
        public void Test()
        {
            int target = 3;

            /* 哈希查找（数组） */
            int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
            // 初始化哈希表
            Dictionary<int, int> map = new();
            for (int i = 0; i < nums.Length; i++)
            {
                map[nums[i]] = i;  // key: 元素，value: 索引
            }
            int index = hashingSearch(map, target);
            Console.WriteLine("目标元素 3 的索引 = " + index);

            /* 哈希查找（链表） */
            ListNode? head = ListNode.ArrToLinkedList(nums);
            // 初始化哈希表
            Dictionary<int, ListNode> map1 = new();
            while (head != null)
            {
                map1[head.val] = head;  // key: 结点值，value: 结点
                head = head.next;
            }
            ListNode? node = hashingSearch1(map1, target);
            Console.WriteLine("目标结点值 3 的对应结点对象为 " + node);
        }
    }
}
