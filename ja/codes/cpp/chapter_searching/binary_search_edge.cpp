/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 挿入ポイントの二分探索（重複要素あり） */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // 両端閉区間[0, n-1]を初期化
    while (i <= j) {
        int m = i + (j - i) / 2; // 中点インデックスmを計算
        if (nums[m] < target) {
            i = m + 1; // ターゲットは区間[m+1, j]にある
        } else {
            j = m - 1; // ターゲット未満の最初の要素は区間[i, m-1]にある
        }
    }
    // 挿入ポイントiを返す
    return i;
}

/* 最左のターゲットの二分探索 */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // targetの挿入ポイントを見つけることと等価
    int i = binarySearchInsertion(nums, target);
    // targetが見つからなかったため、-1を返す
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // targetが見つかったため、インデックスiを返す
    return i;
}

/* 最右のターゲットの二分探索 */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // 最左のtarget + 1を見つけることに変換
    int i = binarySearchInsertion(nums, target + 1);
    // jは最右のターゲットを指し、iはtargetより大きい最初の要素を指す
    int j = i - 1;
    // targetが見つからなかったため、-1を返す
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // targetが見つかったため、インデックスjを返す
    return j;
}

/* ドライバコード */
int main() {
    // 重複要素を含む配列
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\n配列 nums = ";
    printVector(nums);

    // 左右の境界の二分探索
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "要素 " << target << " の最左インデックスは " << index << " です" << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "要素 " << target << " の最右インデックスは " << index << " です" << endl;
    }

    return 0;
}