/**
 * File: list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    /* 리스트 초기화 */
    vector<int> nums = {1, 3, 2, 5, 4};
    cout << "리스트 nums = ";
    printVector(nums);

    /* 원소 접근 */
    int num = nums[1];
    cout << "인덱스 1의 원소에 접근하여 얻은 num = " << num << endl;

    /* 원소 갱신 */
    nums[1] = 0;
    cout << "인덱스 1의 원소를 0으로 갱신한 후 nums = ";
    printVector(nums);

    /* 리스트 비우기 */
    nums.clear();
    cout << "리스트를 비운 후 nums = ";
    printVector(nums);

    /* 맨 뒤에 원소 추가 */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);
    cout << "원소를 추가한 후 nums = ";
    printVector(nums);

    /* 중간에 원소 삽입 */
    nums.insert(nums.begin() + 3, 6);
    cout << "인덱스 3에 숫자 6을 삽입한 후 nums = ";
    printVector(nums);

    /* 원소 삭제 */
    nums.erase(nums.begin() + 3);
    cout << "인덱스 3의 원소를 삭제한 후 nums = ";
    printVector(nums);

    /* 인덱스를 통해 리스트를 순회한다 */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }
    /* 리스트의 원소를 직접 순회한다 */
    count = 0;
    for (int x : nums) {
        count += x;
    }

    /* 두 리스트 연결 */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    cout << "리스트 nums1을 nums 뒤에 연결한 후 nums = ";
    printVector(nums);

    /* 리스트 정렬 */
    sort(nums.begin(), nums.end());
    cout << "리스트를 정렬한 후 nums = ";
    printVector(nums);

    return 0;
}
