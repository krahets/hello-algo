# 列表

「列表 list」是一个抽象的数据结构概念，它表示元素的有序集合，支持元素访问、修改、添加、删除和遍历等操作，无需使用者考虑容量限制的问题。列表可以基于链表或数组实现。

- 链表天然可以被看作是一个列表，其支持元素增删查改操作，并且可以灵活动态扩容。
- 数组也支持元素增删查改，但由于其长度不可变，因此只能被看作是一个具有长度限制的列表。

当使用数组实现列表时，**长度不可变的性质会导致列表的实用性降低**。这是因为我们通常无法事先确定需要存储多少数据，从而难以选择合适的列表长度。若长度过小，则很可能无法满足使用需求；若长度过大，则会造成内存空间的浪费。

为解决此问题，我们可以使用「动态数组 dynamic array」来实现列表。它继承了数组的各项优点，并且可以在程序运行过程中进行动态扩容。

实际上，**许多编程语言中的标准库提供的列表都是基于动态数组实现的**，例如 Python 中的 `list` 、Java 中的 `ArrayList` 、C++ 中的 `vector` 和 C# 中的 `List` 等。在接下来的讨论中，我们将把“列表”和“动态数组”视为等同的概念。

## 列表常用操作

### 初始化列表

我们通常使用“无初始值”和“有初始值”这两种初始化方法。

Python

```python
    # 初始化列表
    # 无初始值
    nums1: nums[int] = []
    # 有初始值
    nums: nums[int] = [1, 3, 2, 5, 4]
```


Java

```java
    /* 初始化列表 */
    // 无初始值
    List<Integer> nums1 = new ArrayList<>();
    // 有初始值（注意数组的元素类型需为 int[] 的包装类 Integer[]）
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
```










### 访问元素

列表本质上是数组，因此可以在 $O(1)$ 时间内访问和更新元素，效率很高。

Python

```python
    # 访问元素
    num: int = nums[1]  # 访问索引 1 处的元素

    # 更新元素
    nums[1] = 0    # 将索引 1 处的元素更新为 0
```


Java

```java
    /* 访问元素 */
    int num = nums.get(1);  // 访问索引 1 处的元素

    /* 更新元素 */
    nums.set(1, 0);  // 将索引 1 处的元素更新为 0
```










### 插入与删除元素

相较于数组，列表可以自由地添加与删除元素。在列表尾部添加元素的时间复杂度为 $O(1)$ ，但插入和删除元素的效率仍与数组相同，时间复杂度为 $O(n)$ 。

Python

```python
    # 清空列表
    nums.clear()

    # 尾部添加元素
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # 中间插入元素
    nums.insert(3, 6)  # 在索引 3 处插入数字 6

    # 删除元素
    nums.pop(3)        # 删除索引 3 处的元素
```


Java

```java
    /* 清空列表 */
    nums.clear();

    /* 尾部添加元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* 中间插入元素 */
    nums.add(3, 6);  // 在索引 3 处插入数字 6

    /* 删除元素 */
    nums.remove(3);  // 删除索引 3 处的元素
```










### 遍历列表

与数组一样，列表可以根据索引遍历，也可以直接遍历各元素。

Python

```python
    # 通过索引遍历列表
    count = 0
    for i in range(len(nums)):
        count += 1

    # 直接遍历列表元素
    count = 0
    for num in nums:
        count += 1
```


Java

```java
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count++;
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (int num : nums) {
        count++;
    }
```










### 拼接列表

给定一个新列表 `nums1` ，我们可以将该列表拼接到原列表的尾部。

Python

```python
    # 拼接两个列表
    nums1: nums[int] = [6, 8, 7, 10, 9]
    nums += nums1  # 将列表 nums1 拼接到 nums 之后
```


Java

```java
    /* 拼接两个列表 */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // 将列表 nums1 拼接到 nums 之后
```










### 排序列表

完成列表排序后，我们便可以使用在数组类算法题中经常考察的“二分查找”和“双指针”算法。

Python

```python
    # 排序列表
    nums.sort()  # 排序后，列表元素从小到大排列
```


Java

```java
    /* 排序列表 */
    Collections.sort(nums);  // 排序后，列表元素从小到大排列
```










## 列表实现

许多编程语言都提供内置的列表，例如 Java、C++、Python 等。它们的实现比较复杂，各个参数的设定也非常有考究，例如初始容量、扩容倍数等。感兴趣的读者可以查阅源码进行学习。

为了加深对列表工作原理的理解，我们尝试实现一个简易版列表，包括以下三个重点设计。

- **初始容量**：选取一个合理的数组初始容量。在本示例中，我们选择 10 作为初始容量。
- **数量记录**：声明一个变量 `size` ，用于记录列表当前元素数量，并随着元素插入和删除实时更新。根据此变量，我们可以定位列表尾部，以及判断是否需要扩容。
- **扩容机制**：若插入元素时列表容量已满，则需要进行扩容。首先根据扩容倍数创建一个更大的数组，再将当前数组的所有元素依次移动至新数组。在本示例中，我们规定每次将数组扩容至之前的 2 倍。

```src
[file]{my_list}-[class]{my_list}-[func]{}
```



-----------------------------------------------------------------

## MY_LIST
Python: `my_list.py`
```python


class MyList:
    """列表类简易实现"""

    def __init__(self):
        """构造方法"""
        self._capacity: int = 10  # 列表容量
        self._arr: list[int] = [0] * self._capacity  # 数组（存储列表元素）
        self._size: int = 0  # 列表长度（即当前元素数量）
        self._extend_ratio: int = 2  # 每次列表扩容的倍数

    def size(self) -> int:
        """获取列表长度（即当前元素数量）"""
        return self._size

    def capacity(self) -> int:
        """获取列表容量"""
        return self._capacity

    def get(self, index: int) -> int:
        """访问元素"""
        # 索引如果越界则抛出异常，下同
        if index < 0 or index >= self._size:
            raise IndexError("索引越界")
        return self._arr[index]

    def set(self, num: int, index: int):
        """更新元素"""
        if index < 0 or index >= self._size:
            raise IndexError("索引越界")
        self._arr[index] = num

    def add(self, num: int):
        """尾部添加元素"""
        # 元素数量超出容量时，触发扩容机制
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """中间插入元素"""
        if index < 0 or index >= self._size:
            raise IndexError("索引越界")
        # 元素数量超出容量时，触发扩容机制
        if self._size == self.capacity():
            self.extend_capacity()
        # 将索引 index 以及之后的元素都向后移动一位
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # 更新元素数量
        self._size += 1

    def remove(self, index: int) -> int:
        """删除元素"""
        if index < 0 or index >= self._size:
            raise IndexError("索引越界")
        num = self._arr[index]
        # 索引 i 之后的元素都向前移动一位
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # 更新元素数量
        self._size -= 1
        # 返回被删除元素
        return num

    def extend_capacity(self):
        """列表扩容"""
        # 新建一个长度为原数组 __extend_ratio 倍的新数组，并将原数组拷贝到新数组
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # 更新列表容量
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """返回有效长度的列表"""
        return self._arr[: self._size]


"""Driver Code"""
if __name__ == "__main__":
    # 初始化列表
    nums = MyList()
    # 尾部添加元素
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"列表 nums = {nums.to_array()} ，容量 = {nums.capacity()} ，长度 = {nums.size()}")

    # 中间插入元素
    nums.insert(6, index=3)
    print("在索引 3 处插入数字 6 ，得到 nums =", nums.to_array())

    # 删除元素
    nums.remove(3)
    print("删除索引 3 处的元素，得到 nums =", nums.to_array())

    # 访问元素
    num = nums.get(1)
    print("访问索引 1 处的元素，得到 num =", num)

    # 更新元素
    nums.set(0, 1)
    print("将索引 1 处的元素更新为 0 ，得到 nums =", nums.to_array())

    # 测试扩容机制
    for i in range(10):
        # 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        nums.add(i)
    print(f"扩容后的列表 {nums.to_array()} ，容量 = {nums.capacity()} ，长度 = {nums.size()}")
```

Java: `my_list.java`
```java

package chapter_array_and_linkedlist;

import java.util.*;

/* 列表类简易实现 */
class MyList {
    private int[] arr; // 数组（存储列表元素）
    private int capacity = 10; // 列表容量
    private int size = 0; // 列表长度（即当前元素数量）
    private int extendRatio = 2; // 每次列表扩容的倍数

    /* 构造方法 */
    public MyList() {
        arr = new int[capacity];
    }

    /* 获取列表长度（即当前元素数量） */
    public int size() {
        return size;
    }

    /* 获取列表容量 */
    public int capacity() {
        return capacity;
    }

    /* 访问元素 */
    public int get(int index) {
        // 索引如果越界则抛出异常，下同
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        return arr[index];
    }

    /* 更新元素 */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        arr[index] = num;
    }

    /* 尾部添加元素 */
    public void add(int num) {
        // 元素数量超出容量时，触发扩容机制
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // 更新元素数量
        size++;
    }

    /* 中间插入元素 */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        // 元素数量超出容量时，触发扩容机制
        if (size == capacity())
            extendCapacity();
        // 将索引 index 以及之后的元素都向后移动一位
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 更新元素数量
        size++;
    }

    /* 删除元素 */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("索引越界");
        int num = arr[index];
        // 将索引 index 之后的元素都向前移动一位
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 更新元素数量
        size--;
        // 返回被删除元素
        return num;
    }

    /* 列表扩容 */
    public void extendCapacity() {
        // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组拷贝到新数组
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // 更新列表容量
        capacity = arr.length;
    }

    /* 将列表转换为数组 */
    public int[] toArray() {
        int size = size();
        // 仅转换有效长度范围内的列表元素
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* Driver Code */
    public static void main(String[] args) {
        /* 初始化列表 */
        MyList nums = new MyList();
        /* 尾部添加元素 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("列表 nums = " + Arrays.toString(nums.toArray()) +
                " ，容量 = " + nums.capacity() + " ，长度 = " + nums.size());

        /* 中间插入元素 */
        nums.insert(3, 6);
        System.out.println("在索引 3 处插入数字 6 ，得到 nums = " + Arrays.toString(nums.toArray()));

        /* 删除元素 */
        nums.remove(3);
        System.out.println("删除索引 3 处的元素，得到 nums = " + Arrays.toString(nums.toArray()));

        /* 访问元素 */
        int num = nums.get(1);
        System.out.println("访问索引 1 处的元素，得到 num = " + num);

        /* 更新元素 */
        nums.set(1, 0);
        System.out.println("将索引 1 处的元素更新为 0 ，得到 nums = " + Arrays.toString(nums.toArray()));

        /* 测试扩容机制 */
        for (int i = 0; i < 10; i++) {
            // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
            nums.add(i);
        }
        System.out.println("扩容后的列表 nums = " + Arrays.toString(nums.toArray()) +
                " ，容量 = " + nums.capacity() + " ，长度 = " + nums.size());
    }
}
```




-----------------------------------------------------------------

