// File: print_utils.go
// Created Time: 2022-12-24
// Author: dlfld (2441086385@qq.com)

package chapter_array_and_linkedlist

import "fmt"

func PrintLinkedList(head *ListNode){
    for head != nil{
        fmt.Printf("%v ",head.Val)
        head = head.Next
    }
}