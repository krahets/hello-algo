---
comments: true
---

# 数组

「数组 Array」是一种将 **相同类型元素** 存储在 **连续内存空间** 的数据结构，将元素在数组中的位置称为元素的「索引 Index」。

![array_definition](array.assets/array_definition.png)

<p align="center"> Fig. 数组定义与存储方式 </p>

!!! note

    观察上图，我们发现 **数组首元素的索引为 $0$** 。你可能会想，这并不符合日常习惯，首个元素的索引为什么不是 $1$ 呢，这不是更加自然吗？我认同你的想法，但请先记住这个设定，后面讲内存地址计算时，我会尝试解答这个问题。

**数组有多种初始化写法**。根据实际需要，选代码最短的那一种就好。

=== "Java"

    ```java title="array.java"
    /* 初始化数组 */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 初始化数组 */
    int* arr = new int[5];
    int* nums = new int[5] { 1, 3, 2, 5, 4 };
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
    /* 随机返回一个数组元素 */
    int randomAccess(int[] nums) {
        int randomIndex = ThreadLocalRandom.current().
                          nextInt(0, nums.length);
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 随机返回一个数组元素 */
    int randomAccess(int* nums, int size) {
        // 在区间 [0, size) 中随机抽取一个数字
        int randomIndex = rand() % size;
        // 获取并返回随机元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Python"

    ```python title="array.py"
    """ 随机访问元素 """
    def randomAccess(nums):
        # 在区间 [0, len(nums)) 中随机抽取一个数字
        random_index = random.randint(0, len(nums))
        # 获取并返回随机元素
        random_num = nums[random_index]
        return random_num
    ```

=== "Go"

    ```go title="array.go"
    /* 随机返回一个数组元素 */
    func randomAccess(nums []int) (randomNum int) {
        // 在区间 [0, nums.length) 中随机抽取一个数字
        randomIndex := rand.Intn(len(nums))
        // 获取并返回随机元素
        randomNum = nums[randomIndex]
        return
    }
    ```

=== "JavaScript"

    ```javascript title="array.js"
    /* 随机返回一个数组元素 */
    function randomAccess(nums) {
        // 在区间 [0, nums.length) 中随机抽取一个数字
        const random_index = Math.floor(Math.random() * nums.length);
        // 获取并返回随机元素
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    /* 随机返回一个数组元素 */
    function randomAccess(nums: number[]): number {
        // 在区间 [0, nums.length) 中随机抽取一个数字
        const random_index = Math.floor(Math.random() * nums.length);
        // 获取并返回随机元素
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "C"

    ```c title="array.c"
    
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 随机返回一个数组元素 */
    int RandomAccess(int[] nums)
    {
        Random random=new();
        int randomIndex = random.Next(nums.Length);
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 随机返回一个数组元素 */
    func randomAccess(nums: [Int]) -> Int {
        // 在区间 [0, nums.count) 中随机抽取一个数字
        let randomIndex = nums.indices.randomElement()!
        // 获取并返回随机元素
        let randomNum = nums[randomIndex]
        return randomNum
    }
    ```

## 数组缺点

**数组在初始化后长度不可变**。由于系统无法保证数组之后的内存空间是可用的，因此数组长度无法扩展。而若希望扩容数组，则需新建一个数组，然后把原数组元素依次拷贝到新数组，在数组很大的情况下，这是非常耗时的。

=== "Java"

    ```java title="array.java"
    /* 扩展数组长度 */
    int[] extend(int[] nums, int enlarge) {
        // 初始化一个扩展长度后的数组
        int[] res = new int[nums.length + enlarge];
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 扩展数组长度 */
    int* extend(int* nums, int size, int enlarge) {
        // 初始化一个扩展长度后的数组
        int* res = new int[size + enlarge];
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // 释放内存
        delete[] nums;
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "Python"

    ```python title="array.py"
    """ 扩展数组长度 """
    # 请注意，Python 的 list 是动态数组，可以直接扩展
    # 为了方便学习，本函数将 list 看作是长度不可变的数组
    def extend(nums, enlarge):
        # 初始化一个扩展长度后的数组
        res = [0] * (len(nums) + enlarge)
        # 将原数组中的所有元素复制到新数组
        for i in range(len(nums)):
            res[i] = nums[i]
        # 返回扩展后的新数组
        return res
    ```

=== "Go"

    ```go title="array.go"
    /* 扩展数组长度 */
    func extend(nums []int, enlarge int) []int {
        // 初始化一个扩展长度后的数组
        res := make([]int, len(nums)+enlarge)
        // 将原数组中的所有元素复制到新数组
        for i, num := range nums {
            res[i] = num
        }
        // 返回扩展后的新数组
        return res
    }
    ```

=== "JavaScript"

    ```javascript title="array.js"
    /* 扩展数组长度 */
    function extend(nums, enlarge) {
        // 初始化一个扩展长度后的数组
        const res = new Array(nums.length + enlarge).fill(0);
        // 将原数组中的所有元素复制到新数组
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    /* 扩展数组长度 */
    function extend(nums: number[], enlarge: number): number[] {
        // 初始化一个扩展长度后的数组
        const res = new Array(nums.length + enlarge).fill(0);
        // 将原数组中的所有元素复制到新数组
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "C"

    ```c title="array.c"
    
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 扩展数组长度 */
    int[] Extend(int[] nums, int enlarge)
    {
        // 初始化一个扩展长度后的数组
        int[] res = new int[nums.Length + enlarge];
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < nums.Length; i++)
        {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        return res;
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 扩展数组长度 */
    func extend(nums: [Int], enlarge: Int) -> [Int] {
        // 初始化一个扩展长度后的数组
        var res = Array(repeating: 0, count: nums.count + enlarge)
        // 将原数组中的所有元素复制到新数组
        for i in nums.indices {
            res[i] = nums[i]
        }
        // 返回扩展后的新数组
        return res
    }
    ```

**数组中插入或删除元素效率低下**。假设我们想要在数组中间某位置插入一个元素，由于数组元素在内存中是“紧挨着的”，它们之间没有空间再放任何数据。因此，我们不得不将此索引之后的所有元素都向后移动一位，然后再把元素赋值给该索引。删除元素也是类似，需要把此索引之后的元素都向前移动一位。总体看有以下缺点：

- **时间复杂度高**：数组的插入和删除的平均时间复杂度均为 $O(N)$ ，其中 $N$ 为数组长度。
- **丢失元素**：由于数组的长度不可变，因此在插入元素后，超出数组长度范围的元素会被丢失。
- **内存浪费**：我们一般会初始化一个比较长的数组，只用前面一部分，这样在插入数据时，丢失的末尾元素都是我们不关心的，但这样做同时也会造成内存空间的浪费。

![array_insert_remove_element](array.assets/array_insert_remove_element.png)

<p align="center"> Fig. 在数组中插入与删除元素 </p>

=== "Java"

    ```java title="array.java"
    /* 在数组的索引 index 处插入元素 num */
    void insert(int[] nums, int num, int index) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处元素
        nums[index] = num;
    }
    
    /* 删除索引 index 处元素 */
    void remove(int[] nums, int index) {
        // 把索引 index 之后的所有元素向前移动一位
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 在数组的索引 index 处插入元素 num */
    void insert(int* nums, int size, int num, int index) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处元素
        nums[index] = num;
    }
    
    /* 删除索引 index 处元素 */
    void remove(int* nums, int size, int index) {
        // 把索引 index 之后的所有元素向前移动一位
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Python"

    ```python title="array.py"
    """ 在数组的索引 index 处插入元素 num """
    def insert(nums, num, index):
        # 把索引 index 以及之后的所有元素向后移动一位
        for i in range(len(nums) - 1, index, -1):
            nums[i] = nums[i - 1]
        # 将 num 赋给 index 处元素
        nums[index] = num
    
    """ 删除索引 index 处元素 """
    def remove(nums, index):
        # 把索引 index 之后的所有元素向前移动一位
        for i in range(index, len(nums) - 1):
            nums[i] = nums[i + 1]
    ```

=== "Go"

    ```go title="array.go"
    /* 在数组的索引 index 处插入元素 num */
    func insert(nums []int, num int, index int) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for i := len(nums) - 1; i > index; i-- {
            nums[i] = nums[i-1]
        }
        // 将 num 赋给 index 处元素
        nums[index] = num
    }

    /* 删除索引 index 处元素 */
    func remove(nums []int, index int) {
        // 把索引 index 之后的所有元素向前移动一位
        for i := index; i < len(nums)-1; i++ {
            nums[i] = nums[i+1]
        }
    }
    ```

=== "JavaScript"

    ```javascript title="array.js"
    /* 在数组的索引 index 处插入元素 num */
    function insert(nums, num, index) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处元素
        nums[index] = num;
    }
    
    /* 删除索引 index 处元素 */
    function remove(nums, index) {
        // 把索引 index 之后的所有元素向前移动一位
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    /* 在数组的索引 index 处插入元素 num */
    function insert(nums: number[], num: number, index: number): void {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处元素
        nums[index] = num;
    }
    
    /* 删除索引 index 处元素 */
    function remove(nums: number[], index: number): void {
        // 把索引 index 之后的所有元素向前移动一位
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C"

    ```c title="array.c"
    
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 在数组的索引 index 处插入元素 num */
    void Insert(int[] nums, int num, int index)
    {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (int i = nums.Length - 1; i > index; i--)
        {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处元素
        nums[index] = num;
    }
    /* 删除索引 index 处元素 */
    void Remove(int[] nums, int index)
    {
        // 把索引 index 之后的所有元素向前移动一位
        for (int i = index; i < nums.Length - 1; i++)
        {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 在数组的索引 index 处插入元素 num */
    func insert(nums: inout [Int], num: Int, index: Int) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for i in sequence(first: nums.count - 1, next: { $0 > index + 1 ? $0 - 1 : nil }) {
            nums[i] = nums[i - 1]
        }
        // 将 num 赋给 index 处元素
        nums[index] = num
    }

    /* 删除索引 index 处元素 */
    func remove(nums: inout [Int], index: Int) {
        let count = nums.count
        // 把索引 index 之后的所有元素向前移动一位
        for i in sequence(first: index, next: { $0 < count - 1 - 1 ? $0 + 1 : nil }) {
            nums[i] = nums[i + 1]
        }
    }
    ```

## 数组常用操作

**数组遍历**。以下介绍两种常用的遍历方法。

=== "Java"

    ```java title="array.java"
    /* 遍历数组 */
    void traverse(int[] nums) {
        int count = 0;
        // 通过索引遍历数组
        for (int i = 0; i < nums.length; i++) {
            count++;
        }
        // 直接遍历数组
        for (int num : nums) {
            count++;
        }
    }
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 遍历数组 */
    void traverse(int* nums, int size) {
        int count = 0;
        // 通过索引遍历数组
        for (int i = 0; i < size; i++) {
            count++;
        }
    }  
    ```

=== "Python"

    ```python title="array.py"
    """ 遍历数组 """
    def traverse(nums):
        count = 0
        # 通过索引遍历数组
        for i in range(len(nums)):
            count += 1
        # 直接遍历数组
        for num in nums:
            count += 1
    ```

=== "Go"

    ```go title="array.go"
    /* 遍历数组 */
    func traverse(nums []int) {
        count := 0
        // 通过索引遍历数组
        for i := 0; i < len(nums); i++ {
            count++
        }
        // 直接遍历数组
        for range nums {
            count++
        }
    }
    ```

=== "JavaScript"

    ```javascript title="array.js"
    /* 遍历数组 */
    function traverse(nums) {
        let count = 0;
        // 通过索引遍历数组
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        // 直接遍历数组
        for (let num of nums) {
            count += 1;
        }
    }
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    /* 遍历数组 */
    function traverse(nums: number[]): void {
        let count = 0;
        // 通过索引遍历数组
        for (let i = 0; i < nums.length; i++) {
            count++;
        }
        // 直接遍历数组
        for(let num of nums){
            count += 1;
        }
    }
    ```

=== "C"

    ```c title="array.c"
    
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 遍历数组 */
    void Traverse(int[] nums)
    {
        int count = 0;
        // 通过索引遍历数组
        for (int i = 0; i < nums.Length; i++)
        {
            count++;
        }
        // 直接遍历数组
        foreach (int num in nums)
        {
            count++;
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 遍历数组 */
    func traverse(nums: [Int]) {
        var count = 0
        // 通过索引遍历数组
        for _ in nums.indices {
            count += 1
        }
        // 直接遍历数组
        for _ in nums {
            count += 1
        }
    }
    ```

**数组查找**。通过遍历数组，查找数组内的指定元素，并输出对应索引。

=== "Java"

    ```java title="array.java"
    /* 在数组中查找指定元素 */
    int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 在数组中查找指定元素 */
    int find(int* nums, int size, int target) {
        for (int i = 0; i < size; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Python"

    ```python title="array.py"
    """ 在数组中查找指定元素 """
    def find(nums, target):
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1
    ```

=== "Go"

    ```go title="array.go"
    /* 在数组中查找指定元素 */
    func find(nums []int, target int) (index int) {
        index = -1
        for i := 0; i < len(nums); i++ {
            if nums[i] == target {
                index = i
                break
            }
        }
        return
    }
    ```

=== "JavaScript"

    ```javascript title="array.js"
    /* 在数组中查找指定元素 */
    function find(nums, target) {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] == target) return i;
        }
        return -1;
    }
    ```

=== "TypeScript"

    ```typescript title="array.ts"
    /* 在数组中查找指定元素 */
    function find(nums: number[], target: number): number {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] === target) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "C"

    ```c title="array.c"
    
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 在数组中查找指定元素 */
    int Find(int[] nums, int target)
    {
        for (int i = 0; i < nums.Length; i++)
        {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 在数组中查找指定元素 */
    func find(nums: [Int], target: Int) -> Int {
        for i in nums.indices {
            if nums[i] == target {
                return i
            }
        }
        return -1
    }
    ```

## 数组典型应用

**随机访问**。如果我们想要随机抽取一些样本，那么可以用数组存储，并生成一个随机序列，根据索引实现样本的随机抽取。

**二分查找**。例如前文查字典的例子，我们可以将字典中的所有字按照拼音顺序存储在数组中，然后使用与日常查纸质字典相同的“翻开中间，排除一半”的方式，来实现一个查电子字典的算法。

**深度学习**。神经网络中大量使用了向量、矩阵、张量之间的线性代数运算，这些数据都是以数组的形式构建的。数组是神经网络编程中最常使用的数据结构。
