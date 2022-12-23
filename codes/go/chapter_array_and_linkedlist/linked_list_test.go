// File: linked_list_test.go
// Created Time: 2022-12-23
// Author: dlfld (2441086385@qq.com)
package chapter_array_and_linkedlist

import (
    "fmt"
    "testing"
)

/* Driver Code */
func TestLinkedList(t *testing.T) {
    /* 初始化链表 1 -> 3 -> 2 -> 5 -> 4 */
    // 初始化各个结点
    n0 := &ListNode{1,nil}
    n1 := &ListNode{2,nil}
    n2 := &ListNode{3,nil}
    n3 := &ListNode{4,nil}
    n4 := &ListNode{5,nil}
    // 构建引用指向
    n0.Next = n1
    n1.Next = n2
    n2.Next = n3
    n3.Next = n4

    for n0 != nil{
        fmt.Printf("%v ",n0.Val)
        n0 = n0.Next
    }
}