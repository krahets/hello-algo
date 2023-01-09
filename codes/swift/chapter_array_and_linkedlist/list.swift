/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver Code */
    static func main() {
        /* 初始化列表 */
        var list = [1, 3, 2, 5, 4]
        print("列表 list = \(list)")

        /* 访问元素 */
        let num = list[1]
        print("访问索引 1 处的元素，得到 num = \(num)")

        /* 更新元素 */
        list[1] = 0
        print("将索引 1 处的元素更新为 0 ，得到 list = \(list)")

        /* 清空列表 */
        list.removeAll()
        print("清空列表后 list = \(list)")

        /* 尾部添加元素 */
        list.append(1)
        list.append(3)
        list.append(2)
        list.append(5)
        list.append(4)
        print("添加元素后 list = \(list)")

        /* 中间插入元素 */
        list.insert(6, at: 3)
        print("在索引 3 处插入数字 6 ，得到 list = \(list)")

        /* 删除元素 */
        list.remove(at: 3)
        print("删除索引 3 处的元素，得到 list = \(list)")

        /* 通过索引遍历列表 */
        var count = 0
        for _ in list.indices {
            count += 1
        }

        /* 直接遍历列表元素 */
        count = 0
        for _ in list {
            count += 1
        }

        /* 拼接两个列表 */
        let list1 = [6, 8, 7, 10, 9]
        list.append(contentsOf: list1)
        print("将列表 list1 拼接到 list 之后，得到 list = \(list)")

        /* 排序列表 */
        list.sort()
        print("排序列表后 list = \(list)")
    }
}
