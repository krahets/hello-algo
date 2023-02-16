---
comments: true
---

# 数组

「数组 Array」是一种将 **相同类型元素** 存储在 **连续内存空间** 的数据结构，将元素在数组中的位置称为元素的「索引 Index」。

![array_definition](array.assets/array_definition.png)

<p align="center"> Fig. 数组定义与存储方式 </p>

!!! note

    观察上图，我们发现 **数组首元素的索引为 $0$** 。你可能会想，这并不符合日常习惯，首个元素的索引为什么不是 $1$ 呢，这不是更加自然吗？我认同你的想法，但请先记住这个设定，后面讲内存地址计算时，我会尝试解答这个问题。

**数组初始化**。一般会用到无初始值、给定初始值两种写法，可根据需求选取。在不给定初始值的情况下，一般所有元素会被初始化为默认值 $0$ 。

=== "Java"

    ```java title="array.java"
    /* 初始化数组 */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 初始化数组 */
    // 存储在栈上
    int arr[5];
    int nums[5] { 1, 3, 2, 5, 4 };
    // 存储在堆上
    int* arr1 = new int[5];
    int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
    ```

=== "Python"

    ```python title="array.py"
    """ 初始化数组 """
    arr = [0] * 5  # [ 0, 0, 0, 0, 0 ]
    nums = [1, 3, 2, 5, 4]  
    ```

=== "Go"

    ```go title="array.go"
    /* 初始化数组 */
    var arr [5]int
    // 在 Go 中，指定长度时（[5]int）为数组，不指定长度时（[]int）为切片
    // 由于 Go 的数组被设计为在编译期确定长度，因此只能使用常量来指定长度
    // 为了方便实现扩容 extend() 方法，以下将切片（Slice）看作数组（Array）
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "JavaScript"

    ```javascript title="array.js"
    /* 初始化数组 */
    var arr = new Array(5).fill(0);
    var nums = [1, 3, 2, 5, 4];
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    /* 初始化数组 */
    let arr: number[] = new Array(5).fill(0);
    let nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="array.c"
    int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
    int nums[5] = { 1, 3, 2, 5, 4 };
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 初始化数组 */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 初始化数组 */
    let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
    let nums = [1, 3, 2, 5, 4]
    ```

=== "Zig"

    ```zig title="array.zig"
    // 初始化数组
    var arr = [_]i32{0} ** 5; // { 0, 0, 0, 0, 0 }
    var nums = [_]i32{ 1, 3, 2, 5, 4 };
    ```

## 数组优点

**在数组中访问元素非常高效**。这是因为在数组中，计算元素的内存地址非常容易。给定数组首个元素的地址、和一个元素的索引，利用以下公式可以直接计算得到该元素的内存地址，从而直接访问此元素。

![array_memory_location_calculation](array.assets/array_memory_location_calculation.png)

<p align="center"> Fig. 数组元素的内存地址计算 </p>

```java title=""
// 元素内存地址 = 数组内存地址 + 元素长度 * 元素索引
elementAddr = firtstElementAddr + elementLength * elementIndex
```

**为什么数组元素索引从 0 开始编号？** 根据地址计算公式，**索引本质上表示的是内存地址偏移量**，首个元素的地址偏移量是 $0$ ，那么索引是 $0$ 也就很自然了。

访问元素的高效性带来了许多便利。例如，我们可以在 $O(1)$ 时间内随机获取一个数组中的元素。

=== "Java"

    ```java title="array.java"
    [class]{array}-[func]{randomAccess}
    ```

=== "C++"

    ```cpp title="array.cpp"
    [class]{}-[func]{randomAccess}
    ```

=== "Python"

    ```python title="array.py"
    [class]{}-[func]{random_access}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{randomAccess}
    ```

=== "JavaScript"

    ```javascript title="array.js"
    [class]{}-[func]{randomAccess}
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    [class]{}-[func]{randomAccess}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{randomAccess}
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{randomAccess}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{randomAccess}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{randomAccess}
    ```

## 数组缺点

**数组在初始化后长度不可变**。由于系统无法保证数组之后的内存空间是可用的，因此数组长度无法扩展。而若希望扩容数组，则需新建一个数组，然后把原数组元素依次拷贝到新数组，在数组很大的情况下，这是非常耗时的。

=== "Java"

    ```java title="array.java"
    [class]{array}-[func]{extend}
    ```

=== "C++"

    ```cpp title="array.cpp"
    [class]{}-[func]{extend}
    ```

=== "Python"

    ```python title="array.py"
    [class]{}-[func]{extend}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{extend}
    ```

=== "JavaScript"

    ```javascript title="array.js"
    [class]{}-[func]{extend}
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    [class]{}-[func]{extend}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{extend}
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{extend}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{extend}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{extend}
    ```

**数组中插入或删除元素效率低下**。假设我们想要在数组中间某位置插入一个元素，由于数组元素在内存中是“紧挨着的”，它们之间没有空间再放任何数据。因此，我们不得不将此索引之后的所有元素都向后移动一位，然后再把元素赋值给该索引。删除元素也是类似，需要把此索引之后的元素都向前移动一位。总体看有以下缺点：

- **时间复杂度高**：数组的插入和删除的平均时间复杂度均为 $O(N)$ ，其中 $N$ 为数组长度。
- **丢失元素**：由于数组的长度不可变，因此在插入元素后，超出数组长度范围的元素会被丢失。
- **内存浪费**：我们一般会初始化一个比较长的数组，只用前面一部分，这样在插入数据时，丢失的末尾元素都是我们不关心的，但这样做同时也会造成内存空间的浪费。

![array_insert_remove_element](array.assets/array_insert_remove_element.png)

<p align="center"> Fig. 在数组中插入与删除元素 </p>

=== "Java"

    ```java title="array.java"
    [class]{array}-[func]{insert}

    [class]{array}-[func]{remove}
    ```

=== "C++"

    ```cpp title="array.cpp"
    [class]{}-[func]{insert}

    [class]{}-[func]{remove}
    ```

=== "Python"

    ```python title="array.py"
    [class]{}-[func]{insert}
    
    [class]{}-[func]{remove}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{insert}

    [class]{}-[func]{remove}
    ```

=== "JavaScript"

    ```javascript title="array.js"
    [class]{}-[func]{insert}

    [class]{}-[func]{remove}
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    [class]{}-[func]{insert}

    [class]{}-[func]{remove}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{insert}

    [class]{}-[func]{removeItem}
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{insert}

    [class]{array}-[func]{remove}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{insert}

    [class]{}-[func]{remove}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{insert}

    [class]{}-[func]{remove}
    ```

## 数组常用操作

**数组遍历**。以下介绍两种常用的遍历方法。

=== "Java"

    ```java title="array.java"
    [class]{array}-[func]{traverse}
    ```

=== "C++"

    ```cpp title="array.cpp"
    [class]{}-[func]{traverse}
    ```

=== "Python"

    ```python title="array.py"
    [class]{}-[func]{traverse}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{traverse}
    ```

=== "JavaScript"

    ```javascript title="array.js"
    [class]{}-[func]{traverse}
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    [class]{}-[func]{traverse}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{traverse}
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{traverse}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{traverse}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{traverse}
    ```

**数组查找**。通过遍历数组，查找数组内的指定元素，并输出对应索引。

=== "Java"

    ```java title="array.java"
    [class]{array}-[func]{find}
    ```

=== "C++"

    ```cpp title="array.cpp"
    [class]{}-[func]{find}
    ```

=== "Python"

    ```python title="array.py"
    [class]{}-[func]{find}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{find}
    ```

=== "JavaScript"

    ```javascript title="array.js"
    [class]{}-[func]{find}
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    [class]{}-[func]{find}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{find}
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{find}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{find}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{find}
    ```

## 数组典型应用

**随机访问**。如果我们想要随机抽取一些样本，那么可以用数组存储，并生成一个随机序列，根据索引实现样本的随机抽取。

**二分查找**。例如前文查字典的例子，我们可以将字典中的所有字按照拼音顺序存储在数组中，然后使用与日常查纸质字典相同的“翻开中间，排除一半”的方式，来实现一个查电子字典的算法。

**深度学习**。神经网络中大量使用了向量、矩阵、张量之间的线性代数运算，这些数据都是以数组的形式构建的。数组是神经网络编程中最常使用的数据结构。
