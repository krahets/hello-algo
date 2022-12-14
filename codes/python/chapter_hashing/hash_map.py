"""
File: hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""

if __name__ == "__main__":
    """ 初始化哈希表 """
    Map = {}

    """ 添加操作 """
    # 在哈希表中添加键值对 (key, value)
    Map[12836] = "小哈"
    Map[15937] = "小啰"
    Map[16750] = "小算"
    Map[13276] = "小法"
    Map[10583] = "小鸭"
    print("\n添加完成后，哈希表为\nKey -> Value")
    for key, value in Map.items():
        print(key, "->", value)

    """ 查询操作 """
    # 向哈希表输入键 key ，得到值 value
    name = Map[15937]
    print("\n输入学号 15937 ，查询到姓名 " + name)

    """ 删除操作 """
    # 在哈希表中删除键值对 (key, value)
    Map.pop(10583)
    print("\n删除 10583 后，哈希表为\nKey -> Value")
    for key, value in Map.items():
        print(key, "->", value)

    """ 遍历哈希表 """
    print("\n遍历键值对 Key->Value")
    for key, value in Map.items():
        print(key, "->", value)

    print("\n单独遍历键 Key")
    for key in Map.keys():
        print(key)

    print("\n单独遍历值 Value")
    for val in Map.values():
        print(val)

