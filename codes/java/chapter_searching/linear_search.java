/**
 * File: linear_search.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_searching;

import org.junit.Test;
import utils.*;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class linear_search {
    /* 线性查找（数组） */
    static int linearSearchArray(int[] nums, int target) {
        // 遍历数组
        for (int i = 0; i < nums.length; i++) {
            // 找到目标元素，返回其索引
            if (nums[i] == target)
                return i;
        }
        // 未找到目标元素，返回 -1
        return -1;
    }

    /* 线性查找（链表） */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // 遍历链表
        while (head != null) {
            // 找到目标节点，返回之
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 未找到目标节点，返回 null
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* 在数组中执行线性查找 */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("目标元素 3 的索引 = " + index);

        /* 在链表中执行线性查找 */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("目标节点值 3 的对应节点对象为 " + node);
    }

    @Test
    public void testLinearSearch() {

        int[] testNumArr = {3, 2, 1, 4, 5};

        // Test case 1: Number is found in the beginning of the array.
        int findNum1 = 3;
        int expectedIndex1 = 0;
        int result1 = linearSearchArray(testNumArr, findNum1);
        assertEquals(expectedIndex1, result1);

        // Test case 2: Number is found at the middle of the array.
        int findNum2 = 1;
        int expectedIndex2 = 2;
        int result2 = linearSearchArray(testNumArr, findNum2);
        assertEquals(expectedIndex2, result2);

        // Test case 3: Number is not found in the array.
        int findNum3 = 6; // Not in the array.
        int expectedIndex3 = -1;
        int result3 = linearSearchArray(testNumArr, findNum3);
        assertEquals(expectedIndex3, result3);

        // Test case 4: Empty array.
        int[] testEmptyArr = {};
        int findNum4 = 1;
        int expectedIndex4 = -1;
        int result4 = linearSearchArray(testEmptyArr, findNum4);
        assertEquals(expectedIndex4, result4);

        // Test case 5: Number is found at the end of the array.
        int findNum5 = 5;
        int expectedIndex5 = 4;
        int result5 = linearSearchArray(testNumArr, findNum5);
        assertEquals(expectedIndex5, result5);
    }

}
