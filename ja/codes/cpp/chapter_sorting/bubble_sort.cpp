/**
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バブルソート */
void bubbleSort(vector<int> &nums) {
    // 外側のループ：未ソート区間は [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                // ここでは std::swap() 関数を使う
                swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* バブルソート（フラグによる最適化）*/
void bubbleSortWithFlag(vector<int> &nums) {
    // 外側のループ：未ソート区間は [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // フラグを初期化する
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                // ここでは std::swap() 関数を使う
                swap(nums[j], nums[j + 1]);
                flag = true; // 要素を交換したことを記録する
            }
        }
        if (!flag)
            break; // 今回の「バブル」で要素を一度も交換しなかった場合、直ちに終了する
    }
}

/* 実行用コード */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    cout << "バブルソート完了後 nums = ";
    printVector(nums);

    vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    cout << "バブルソート完了後 nums1 = ";
    printVector(nums1);

    return 0;
}
