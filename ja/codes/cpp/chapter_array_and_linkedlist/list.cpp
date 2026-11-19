/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    // [region]{init_list}
    /* リストを初期化する */
    // 初期値なし
    vector<int> emptyNums;
    // 初期値あり
    vector<int> nums = {1, 3, 2, 5, 4};
    // [endregion]{init_list}
    cout << "リスト nums = ";
    printVector(nums);
    cout << "リスト emptyNums = ";
    printVector(emptyNums);

    // [region]{access_element}
    /* 要素にアクセスする */
    int num = nums[1]; // インデックス 1 の要素にアクセスする
    // [endregion]{access_element}
    cout << "インデックス 1 の要素にアクセスした結果 num = " << num << endl;

    // [region]{update_element}
    /* 要素を更新する */
    nums[1] = 0; // インデックス 1 の要素を 0 に更新する
    // [endregion]{update_element}
    cout << "インデックス 1 の要素を 0 に更新した結果 nums = ";
    printVector(nums);

    // [region]{clear_list}
    /* リストを空にする */
    nums.clear();
    // [endregion]{clear_list}
    cout << "リストを空にした後 nums = ";
    printVector(nums);

    // [region]{append_element}
    /* 末尾に要素を追加する */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    // [endregion]{append_element}
    cout << "要素を追加した後 nums = ";
    printVector(nums);

    // [region]{insert_element}
    /* 途中に要素を挿入する */
    nums.insert(nums.begin() + 3, 6); // インデックス 3 に数値 6 を挿入する
    // [endregion]{insert_element}
    cout << "インデックス 3 に数値 6 を挿入した結果 nums = ";
    printVector(nums);

    // [region]{remove_element}
    /* 要素を削除する */
    nums.erase(nums.begin() + 3); // インデックス 3 の要素を削除する
    // [endregion]{remove_element}
    cout << "インデックス 3 の要素を削除した結果 nums = ";
    printVector(nums);

    // [region]{iterate_list}
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
    // [endregion]{iterate_list}

    // [region]{concat_list}
    /* 2 つのリストを連結する */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    // リスト nums の後ろに nums1 を連結する
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    // [endregion]{concat_list}
    cout << "リスト nums の後ろに nums1 を連結した結果 nums = ";
    printVector(nums);

    // [region]{sort_list}
    /* リストをソートする */
    sort(nums.begin(), nums.end()); // ソート後、リストの要素は昇順に並ぶ
    // [endregion]{sort_list}
    cout << "リストをソートした後 nums = ";
    printVector(nums);

    return 0;
}
