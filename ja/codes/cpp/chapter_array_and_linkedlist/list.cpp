/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ドライバコード */
int main() {
    /* リストを初期化する */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "リスト nums = ";
    printVector(nums);

    /* 要素にアクセスする */
    int num = nums[1];
    cout << "インデックス 1 の要素を読み出した結果 num = " << num << endl;

    /* 要素を更新する */
    nums[1] = 0;
    cout << "インデックス 1 の要素を 0 に更新した後の nums = ";
    printVector(nums);

    /* リストを空にする */
    nums.clear();
    cout << "リストを空にした後の nums = ";
    printVector(nums);

    /* 末尾に要素を追加する */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    cout << "要素追加後の nums = ";
    printVector(nums);

    /* 途中に要素を挿入する */
    nums.insert(nums.begin() + 3, 6);
    cout << "インデックス 3 に 6 を挿入した後の nums = ";
    printVector(nums);

    /* 要素を削除する */
    nums.erase(nums.begin() + 3);
    cout << "インデックス 3 の要素を削除した後の nums = ";
    printVector(nums);

    /* インデックスを使ってリストを走査する */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }
    /* リストの要素を直接走査する */
    count = 0;
    for (int x : nums) {
        count += x;
    }

    /* 2 つのリストを連結する */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    cout << "リスト nums1 を nums の末尾に連結した後の nums = ";
    printVector(nums);

    /* リストをソートする */
    sort(nums.begin(), nums.end());
    cout << "ソート後のリスト nums = ";
    printVector(nums);

    return 0;
}
