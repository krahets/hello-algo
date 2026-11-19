/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_list}
    /* 初始化列表 */
    // 无初始值
    vector<int> emptyNums;
    // 有初始值
    vector<int> nums = {1, 3, 2, 5, 4};
    // [endregion]{init_list}
    cout << "列表 nums = ";
    printVector(nums);
    cout << "列表 emptyNums = ";
    printVector(emptyNums);

    // [region]{access_element}
    /* 访问元素 */
    int num = nums[1]; // 访问索引 1 处的元素
    // [endregion]{access_element}
    cout << "访问索引 1 处的元素，得到 num = " << num << endl;

    // [region]{update_element}
    /* 更新元素 */
    nums[1] = 0; // 将索引 1 处的元素更新为 0
    // [endregion]{update_element}
    cout << "将索引 1 处的元素更新为 0 ，得到 nums = ";
    printVector(nums);

    // [region]{clear_list}
    /* 清空列表 */
    nums.clear();
    // [endregion]{clear_list}
    cout << "清空列表后 nums = ";
    printVector(nums);

    // [region]{append_element}
    /* 在尾部添加元素 */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    // [endregion]{append_element}
    cout << "添加元素后 nums = ";
    printVector(nums);

    // [region]{insert_element}
    /* 在中间插入元素 */
    nums.insert(nums.begin() + 3, 6); // 在索引 3 处插入数字 6
    // [endregion]{insert_element}
    cout << "在索引 3 处插入数字 6 ，得到 nums = ";
    printVector(nums);

    // [region]{remove_element}
    /* 删除元素 */
    nums.erase(nums.begin() + 3); // 删除索引 3 处的元素
    // [endregion]{remove_element}
    cout << "删除索引 3 处的元素，得到 nums = ";
    printVector(nums);

    // [region]{iterate_list}
    /* 通过索引遍历列表 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* 直接遍历列表元素 */
    count = 0;
    for (int x : nums) {
        count += x;
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    /* 拼接两个列表 */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    // 将列表 nums1 拼接到 nums 之后
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    // [endregion]{concat_list}
    cout << "将列表 nums1 拼接到 nums 之后，得到 nums = ";
    printVector(nums);

    // [region]{sort_list}
    /* 排序列表 */
    sort(nums.begin(), nums.end()); // 排序后，列表元素从小到大排列
    // [endregion]{sort_list}
    cout << "排序列表后 nums = ";
    printVector(nums);

    return 0;
}
