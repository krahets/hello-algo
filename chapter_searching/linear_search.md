---
comments: true
---

# 10.1. &nbsp; 线性查找

「线性查找 Linear Search」是一种简单的查找方法，其从数据结构的一端开始，逐个访问每个元素，直至另一端为止。

## 10.1.1. &nbsp; 算法实现

例如，若我们想要在数组 `nums` 中查找目标元素 `target` 的对应索引，可以采用线性查找方法。

![在数组中线性查找元素](linear_search.assets/linear_search.png)

<p align="center"> Fig. 在数组中线性查找元素 </p>

=== "Java"

    ```java title="linear_search.java"
    /* 线性查找（数组） */
    int linearSearchArray(int[] nums, int target) {
        // 遍历数组
        for (int i = 0; i < nums.length; i++) {
            // 找到目标元素，返回其索引
            if (nums[i] == target)
                return i;
        }
        // 未找到目标元素，返回 -1
        return -1;
    }
    ```

=== "C++"

    ```cpp title="linear_search.cpp"
    /* 线性查找（数组） */
    int linearSearchArray(vector<int>& nums, int target) {
        // 遍历数组
        for (int i = 0; i < nums.size(); i++) {
            // 找到目标元素，返回其索引
            if (nums[i] == target)
                return i;
        }
        // 未找到目标元素，返回 -1
        return -1;
    }
    ```

=== "Python"

    ```python title="linear_search.py"
    def linear_search_array(nums: list[int], target: int) -> int:
        """线性查找（数组）"""
        # 遍历数组
        for i in range(len(nums)):
            if nums[i] == target:  # 找到目标元素，返回其索引
                return i
        return -1  # 未找到目标元素，返回 -1
    ```

=== "Go"

    ```go title="linear_search.go"
    /* 线性查找（数组） */
    func linearSearchArray(nums []int, target int) int {
        // 遍历数组
        for i := 0; i < len(nums); i++ {
            // 找到目标元素，返回其索引
            if nums[i] == target {
                return i
            }
        }
        // 未找到目标元素，返回 -1
        return -1
    }
    ```

=== "JavaScript"

    ```javascript title="linear_search.js"
    /* 线性查找（数组） */
    function linearSearchArray(nums, target) {
        // 遍历数组
        for (let i = 0; i < nums.length; i++) {
            // 找到目标元素，返回其索引
            if (nums[i] === target) {
                return i;
            }
        }
        // 未找到目标元素，返回 -1
        return -1; 
    }
    ```

=== "TypeScript"

    ```typescript title="linear_search.ts"
    /* 线性查找（数组）*/
    function linearSearchArray(nums: number[], target: number): number {
        // 遍历数组
        for (let i = 0; i < nums.length; i++) {
            // 找到目标元素，返回其索引
            if (nums[i] === target) {
                return i;
            }
        }
        // 未找到目标元素，返回 -1
        return -1;
    }
    ```

=== "C"

    ```c title="linear_search.c"
    [class]{}-[func]{linearSearchArray}
    ```

=== "C#"

    ```csharp title="linear_search.cs"
    /* 线性查找（数组） */
    int linearSearchArray(int[] nums, int target)
    {
        // 遍历数组
        for (int i = 0; i < nums.Length; i++)
        {
            // 找到目标元素，返回其索引
            if (nums[i] == target)
                return i;
        }
        // 未找到目标元素，返回 -1
        return -1;
    }
    ```

=== "Swift"

    ```swift title="linear_search.swift"
    /* 线性查找（数组） */
    func linearSearchArray(nums: [Int], target: Int) -> Int {
        // 遍历数组
        for i in nums.indices {
            // 找到目标元素，返回其索引
            if nums[i] == target {
                return i
            }
        }
        // 未找到目标元素，返回 -1
        return -1
    }
    ```

=== "Zig"

    ```zig title="linear_search.zig"
    // 线性查找（数组）
    fn linearSearchArray(comptime T: type, nums: std.ArrayList(T), target: T) T {
        // 遍历数组
        for (nums.items) |num, i| {
            // 找到目标元素， 返回其索引
            if (num == target) {
                return @intCast(T, i);
            }
        }
        // 未找到目标元素，返回 -1
        return -1;
    }
    ```

另一个例子，若需要在链表中查找给定目标节点值 `target` 并返回该节点对象，同样可以使用线性查找。

=== "Java"

    ```java title="linear_search.java"
    /* 线性查找（链表） */
    ListNode linearSearchLinkedList(ListNode head, int target) {
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
    ```

=== "C++"

    ```cpp title="linear_search.cpp"
    /* 线性查找（链表） */
    ListNode* linearSearchLinkedList(ListNode* head, int target) {
        // 遍历链表
        while (head != nullptr) {
            // 找到目标节点，返回之
            if (head->val == target)
                return head;
            head = head->next;
        }
        // 未找到目标节点，返回 nullptr
        return nullptr;
    }
    ```

=== "Python"

    ```python title="linear_search.py"
    def linear_search_linkedlist(head: ListNode, target: int) -> ListNode | None:
        """线性查找（链表）"""
        # 遍历链表
        while head:
            if head.val == target:  # 找到目标节点，返回之
                return head
            head = head.next
        return None  # 未找到目标节点，返回 None
    ```

=== "Go"

    ```go title="linear_search.go"
    /* 线性查找（链表） */
    func linearSearchLinkedList(node *ListNode, target int) *ListNode {
        // 遍历链表
        for node != nil {
            // 找到目标节点，返回之
            if node.Val == target {
                return node
            }
            node = node.Next
        }
        // 未找到目标元素，返回 nil
        return nil
    }
    ```

=== "JavaScript"

    ```javascript title="linear_search.js"
    /* 线性查找（链表）*/
    function linearSearchLinkedList(head, target) {
        // 遍历链表
        while(head) {
            // 找到目标节点，返回之
            if(head.val === target) {
                return head;
            }
            head = head.next;
        }
        // 未找到目标节点，返回 null
        return null;
    }
    ```

=== "TypeScript"

    ```typescript title="linear_search.ts"
    /* 线性查找（链表）*/
    function linearSearchLinkedList(head: ListNode | null, target: number): ListNode | null {
        // 遍历链表
        while (head) {
            // 找到目标节点，返回之
            if (head.val === target) {
                return head;
            }
            head = head.next;
        }
        // 未找到目标节点，返回 null
        return null;
    }
    ```

=== "C"

    ```c title="linear_search.c"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "C#"

    ```csharp title="linear_search.cs"
    /* 线性查找（链表） */
    ListNode? linearSearchLinkedList(ListNode head, int target)
    {
        // 遍历链表
        while (head != null)
        {
            // 找到目标节点，返回之
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 未找到目标节点，返回 null
        return null;
    }
    ```

=== "Swift"

    ```swift title="linear_search.swift"
    /* 线性查找（链表） */
    func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
        var head = head
        // 遍历链表
        while head != nil {
            // 找到目标节点，返回之
            if head?.val == target {
                return head
            }
            head = head?.next
        }
        // 未找到目标节点，返回 null
        return nil
    }
    ```

=== "Zig"

    ```zig title="linear_search.zig"
    // 线性查找（链表）
    fn linearSearchLinkedList(comptime T: type, node: ?*inc.ListNode(T), target: T) ?*inc.ListNode(T) {
        var head = node;
        // 遍历链表
        while (head != null) {
            // 找到目标节点，返回之
            if (head.?.val == target) return head;
            head = head.?.next;
        }
        return null;
    }
    ```

## 10.1.2. &nbsp; 复杂度分析

**时间复杂度 $O(n)$** ：其中 $n$ 代表数组或链表的长度。

**空间复杂度 $O(1)$** ：无需借助额外的存储空间。

## 10.1.3. &nbsp; 优点与局限性

**线性查找具有极佳的通用性**。由于线性查找是逐个访问元素的，没有跳跃式访问，因此适用于数组和链表的查找。

**线性查找的时间复杂度较高**。当数据量 $n$ 较大时，线性查找的效率较低。
