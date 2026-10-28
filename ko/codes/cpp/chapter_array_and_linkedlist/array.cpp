/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 원소에 임의 접근 */
int randomAccess(int *nums, int size) {
    // 구간 [0, size)에서 무작위로 수 하나 선택
    int randomIndex = rand() % size;
    // 무작위 원소를 가져와 반환한다
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* 배열 길이 확장 */
int *extend(int *nums, int size, int enlarge) {
    // 길이를 확장한 배열을 초기화한다
    int *res = new int[size + enlarge];
    // 원래 배열의 모든 원소를 새 배열에 복사한다
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // 메모리 해제
    delete[] nums;
    // 확장한 새 배열을 반환한다
    return res;
}

/* 배열의 인덱스 index에 원소 num 삽입 */
void insert(int *nums, int size, int num, int index) {
    // 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // index 위치의 원소에 num을 대입한다
    nums[index] = num;
}

/* 인덱스 index에 있는 원소 삭제 */
void remove(int *nums, int size, int index) {
    // 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 배열 순회 */
void traverse(int *nums, int size) {
    int count = 0;
    // 인덱스를 통해 배열을 순회한다
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* 배열에서 지정한 원소 탐색 */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* 실행 코드 */
int main() {
    /* 배열 초기화 */
    int size = 5;
    int *arr = new int[size];
    cout << "배열 arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "배열 nums = ";
    printArray(nums, size);

    /* 임의 접근 */
    int randomNum = randomAccess(nums, size);
    cout << "nums에서 무작위로 가져온 원소 " << randomNum << endl;

    /* 길이 확장 */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "배열 길이를 8로 확장한 후 nums = ";
    printArray(nums, size);

    /* 원소 삽입 */
    insert(nums, size, 6, 3);
    cout << "인덱스 3에 숫자 6을 삽입한 후 nums = ";
    printArray(nums, size);

    /* 원소 삭제 */
    remove(nums, size, 2);
    cout << "인덱스 2의 원소를 삭제한 후 nums = ";
    printArray(nums, size);

    /* 배열 순회 */
    traverse(nums, size);

    /* 원소 탐색 */
    int index = find(nums, size, 3);
    cout << "nums에서 원소 3을 탐색하여 얻은 인덱스 = " << index << endl;

    // 메모리 해제
    delete[] arr;
    delete[] nums;

    return 0;
}
