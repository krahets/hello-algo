---
comments: true
---

# 线性查找

「线性查找 Linear Search」是一种最基础的查找方法，其从数据结构的一端开始，依次访问每个元素，直到另一端后停止。

## 算法实现

线性查找实质上就是遍历数据结构 + 判断条件。比如，我们想要在数组 `nums` 中查找目标元素 `target` 的对应索引，那么可以在数组中进行线性查找。

![linear_search](linear_search.assets/linear_search.png)

=== "Java"

    ```java title="linear_search.java"
    [class]{linear_search}-[func]{linearSearchArray}
    ```

=== "C++"

    ```cpp title="linear_search.cpp"
    [class]{}-[func]{linearSearchArray}
    ```

=== "Python"

    ```python title="linear_search.py"
    [class]{}-[func]{linear_search_array}
    ```

=== "Go"

    ```go title="linear_search.go"
    [class]{}-[func]{linearSearchArray}
    ```

=== "JavaScript"

    ```javascript title="linear_search.js"
    [class]{}-[func]{linearSearchArray}
    ```

=== "TypeScript"

    ```typescript title="linear_search.ts"
    [class]{}-[func]{linearSearchArray}
    ```

=== "C"

    ```c title="linear_search.c"
    [class]{}-[func]{linearSearchArray}
    ```

=== "C#"

    ```csharp title="linear_search.cs"
    [class]{linear_search}-[func]{linearSearchArray}
    ```

=== "Swift"

    ```swift title="linear_search.swift"
    [class]{}-[func]{linearSearchArray}
    ```

=== "Zig"

    ```zig title="linear_search.zig"
    [class]{}-[func]{linearSearchArray}
    ```

再比如，我们想要在给定一个目标结点值 `target` ，返回此结点对象，也可以在链表中进行线性查找。

=== "Java"

    ```java title="linear_search.java"
    [class]{linear_search}-[func]{linearSearchLinkedList}
    ```

=== "C++"

    ```cpp title="linear_search.cpp"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "Python"

    ```python title="linear_search.py"
    [class]{}-[func]{linear_search_linkedlist}
    ```

=== "Go"

    ```go title="linear_search.go"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "JavaScript"

    ```javascript title="linear_search.js"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "TypeScript"

    ```typescript title="linear_search.ts"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "C"

    ```c title="linear_search.c"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "C#"

    ```csharp title="linear_search.cs"
    [class]{linear_search}-[func]{linearSearchLinkedList}
    ```

=== "Swift"

    ```swift title="linear_search.swift"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "Zig"

    ```zig title="linear_search.zig"
    [class]{}-[func]{linearSearchLinkedList}
    ```

## 复杂度分析

**时间复杂度 $O(n)$** ：其中 $n$ 为数组或链表长度。

**空间复杂度 $O(1)$** ：无需使用额外空间。

## 优点与缺点

**线性查找的通用性极佳**。由于线性查找是依次访问元素的，即没有跳跃访问元素，因此数组或链表皆适用。

**线性查找的时间复杂度太高**。在数据量 $n$ 很大时，查找效率很低。
