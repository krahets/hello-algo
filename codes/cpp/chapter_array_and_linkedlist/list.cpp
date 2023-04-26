/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 初始化列表 */
    vector<int> list = {1, 3, 2, 5, 4};
    cout << "列表 list = ";
    printVector(list);

    /* 访问元素 */
    int num = list[1];
    cout << "访问索引 1 处的元素，得到 num = " << num << endl;

    /* 更新元素 */
    list[1] = 0;
    cout << "将索引 1 处的元素更新为 0 ，得到 list = ";
    printVector(list);

    /* 清空列表 */
    list.clear();
    cout << "清空列表后 list = ";
    printVector(list);

    /* 尾部添加元素 */
    list.push_back(1);
    list.push_back(3);
    list.push_back(2);
    list.push_back(5);
    list.push_back(4);
    cout << "添加元素后 list = ";
    printVector(list);

    /* 中间插入元素 */
    list.insert(list.begin() + 3, 6);
    cout << "在索引 3 处插入数字 6 ，得到 list = ";
    printVector(list);

    /* 删除元素 */
    list.erase(list.begin() + 3);
    cout << "删除索引 3 处的元素，得到 list = ";
    printVector(list);

    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < list.size(); i++) {
        count++;
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (int n : list) {
        count++;
    }

    /* 拼接两个列表 */
    vector<int> list1 = {6, 8, 7, 10, 9};
    list.insert(list.end(), list1.begin(), list1.end());
    cout << "将列表 list1 拼接到 list 之后，得到 list = ";
    printVector(list);

    /* 排序列表 */
    sort(list.begin(), list.end());
    cout << "排序列表后 list = ";
    printVector(list);

    return 0;
}
