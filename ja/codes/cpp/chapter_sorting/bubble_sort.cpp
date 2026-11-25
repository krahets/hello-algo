/**
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バブルソート */
void bubbleSort(vector<int> &nums) {
    // 外側のループ：未整列区間は [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                // ここでは std::swap() 関数を使用
                swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* バブルソート（フラグによる最適化）*/
void bubbleSortWithFlag(vector<int> &nums) {
    // 外側のループ：未整列区間は [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // フラグを初期化
        // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                // ここでは std::swap() 関数を使用
                swap(nums[j], nums[j + 1]);
                flag = true; // 交換があったことを記録
            }
        }
        if (!flag)
            break; // この走査で交換がなければループを終了
    }
}

/* 実行例 */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    cout << "バブルソート後の nums = ";
    printVector(nums);

    vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    cout << "バブルソート後の nums1 = ";
    printVector(nums1);

    return 0;
}
