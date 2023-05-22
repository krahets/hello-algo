"""
File: list.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # 初始化列表
    arr = [1, 3, 2, 5, 4]
    print("列表 arr =", arr)

    # 访问元素
    num: int = arr[1]
    print("访问索引 1 处的元素，得到 num =", num)

    # 更新元素
    arr[1] = 0
    print("将索引 1 处的元素更新为 0 ，得到 arr =", arr)

    # 清空列表
    arr.clear()
    print("清空列表后 arr =", arr)

    # 尾部添加元素
    arr.append(1)
    arr.append(3)
    arr.append(2)
    arr.append(5)
    arr.append(4)
    print("添加元素后 arr =", arr)

    # 中间插入元素
    arr.insert(3, 6)
    print("在索引 3 处插入数字 6 ，得到 arr =", arr)

    # 删除元素
    arr.pop(3)
    print("删除索引 3 处的元素，得到 arr =", arr)

    # 通过索引遍历列表
    count = 0
    for i in range(len(arr)):
        count += 1

    # 直接遍历列表元素
    count = 0
    for n in arr:
        count += 1

    # 拼接两个列表
    arr1 = [6, 8, 7, 10, 9]
    arr += arr1
    print("将列表 arr1 拼接到 arr 之后，得到 arr =", arr)

    # 排序列表
    arr.sort()
    print("排序列表后 arr =", arr)
