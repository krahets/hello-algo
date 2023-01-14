/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { printLinkedList } from "../module/PrintUtil";
import ListNode from "../module/ListNode";


/* 哈希查找（数组） */
function hashingSearch(map: Map<number, number>, target: number): number {
    // 哈希表的 key: 目标元素，value: 索引
    // 若哈希表中无此 key ，返回 -1
    return map.has(target) ? map.get(target) as number : -1;
}

/* 哈希查找（链表） */
function hashingSearch1(map: Map<number, ListNode>, target: number): ListNode | null {
    // 哈希表的 key: 目标结点值，value: 结点对象
    // 若哈希表中无此 key ，返回 null
    return map.has(target) ? map.get(target) as ListNode : null;
}

function main() {
    const target = 3;

    /* 哈希查找（数组） */
    const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    // 初始化哈希表
    const map = new Map();
    for (let i = 0; i < nums.length; i++) {
      map.set(nums[i], i);  // key: 元素，value: 索引
    }
    const index = hashingSearch(map, target);
    console.log("目标元素 3 的索引 = " + index);

    /* 哈希查找（链表） */
    let head = new ListNode().arrToLinkedList(nums)
    // 初始化哈希表
    const map1 = new Map();
    while (head != null) {
      map1.set(head.val, head);  // key: 结点值，value: 结点
      head = head.next;
    }
    const node = hashingSearch1(map1, target);
    console.log("目标结点值 3 的对应结点对象为");
    printLinkedList(node);
}

main();
