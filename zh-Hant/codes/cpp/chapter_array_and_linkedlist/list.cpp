/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 初始化串列 */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "串列 nums = ";
    printVector(nums);

    /* 訪問元素 */
    int num = nums[1];
    cout << "訪問索引 1 處的元素，得到 num = " << num << endl;

    /* 更新元素 */
    nums[1] = 0;
    cout << "將索引 1 處的元素更新為 0 ，得到 nums = ";
    printVector(nums);

    /* 清空串列 */
    nums.clear();
    cout << "清空串列後 nums = ";
    printVector(nums);

    /* 在尾部新增元素 */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    cout << "新增元素後 nums = ";
    printVector(nums);

    /* 在中間插入元素 */
    nums.insert(nums.begin() + 3, 6);
    cout << "在索引 3 處插入數字 6 ，得到 nums = ";
    printVector(nums);

    /* 刪除元素 */
    nums.erase(nums.begin() + 3);
    cout << "刪除索引 3 處的元素，得到 nums = ";
    printVector(nums);

    /* 透過索引走訪串列 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }
    /* 直接走訪串列元素 */
    count = 0;
    for (int x : nums) {
        count += x;
    }

    /* 拼接兩個串列 */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    cout << "將串列 nums1 拼接到 nums 之後，得到 nums = ";
    printVector(nums);

    /* 排序串列 */
    sort(nums.begin(), nums.end());
    cout << "排序串列後 nums = ";
    printVector(nums);

    return 0;
}
