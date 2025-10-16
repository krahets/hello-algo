/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ドライバーコード */
int main() {
    /* リストを初期化 */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "List nums = ";
    printVector(nums);

    /* 要素にアクセス */
    int num = nums[1];
    cout << "Access the element at index 1, obtained num = " << num << endl;

    /* 要素を更新 */
    nums[1] = 0;
    cout << "Update the element at index 1 to 0, resulting in nums = ";
    printVector(nums);

    /* リストをクリア */
    nums.clear();
    cout << "After clearing the list, nums = ";
    printVector(nums);

    /* 末尾に要素を追加 */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    cout << "After adding elements, nums = ";
    printVector(nums);

    /* 中間に要素を挿入 */
    nums.insert(nums.begin() + 3, 6);
    cout << "Insert the number 6 at index 3, resulting in nums = ";
    printVector(nums);

    /* 要素を削除 */
    nums.erase(nums.begin() + 3);
    cout << "Remove the element at index 3, resulting in nums = ";
    printVector(nums);

    /* インデックスによるリストの走査 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }
    /* リスト要素の走査 */
    count = 0;
    for (int x : nums) {
        count += x;
    }

    /* 2つのリストを連結 */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    cout << "Concatenate list nums1 to nums, resulting in nums = ";
    printVector(nums);

    /* リストをソート */
    sort(nums.begin(), nums.end());
    cout << "After sorting the list, nums = ";
    printVector(nums);

    return 0;
}