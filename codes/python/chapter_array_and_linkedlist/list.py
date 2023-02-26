"""
File: list.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

""" Driver Code """
if __name__ == "__main__":
    """ 初始化列表 """
    my_list = [1, 3, 2, 5, 4]
    print("列表 my_list =", my_list)

    """ 访问元素 """
    num = my_list[1]
    print("访问索引 1 处的元素，得到 num =", num)

    """ 更新元素 """
    my_list[1] = 0
    print("将索引 1 处的元素更新为 0 ，得到 my_list =", my_list)

    """ 清空列表 """
    my_list.clear()
    print("清空列表后 my_list =", my_list)

    """ 尾部添加元素 """
    my_list.append(1)
    my_list.append(3)
    my_list.append(2)
    my_list.append(5)
    my_list.append(4)
    print("添加元素后 my_list =", my_list)

    """ 中间插入元素 """
    my_list.insert(3, 6)
    print("在索引 3 处插入数字 6 ，得到 my_list =", my_list)

    """ 删除元素 """
    my_list.pop(3)
    print("删除索引 3 处的元素，得到 my_list =", my_list)

    """ 通过索引遍历列表 """
    count = 0
    for i in range(len(my_list)):
        count += 1

    """ 直接遍历列表元素 """
    count = 0
    for n in my_list:
        count += 1

    """ 拼接两个列表 """
    new_list = [6, 8, 7, 10, 9]
    my_list += new_list
    print("将列表 new_list 拼接到 my_list 之后，得到 my_list =", my_list)

    """ 排序列表 """
    my_list.sort()
    print("排序列表后 my_list =", my_list)
