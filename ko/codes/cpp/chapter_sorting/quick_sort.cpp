/**
 * File: quick_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 퀵 정렬 클래스 */
class QuickSort {
  private:
    /* 센티널 분할 */
    static int partition(vector<int> &nums, int left, int right) {
        // nums[left]를 피벗으로 삼는다
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
            while (i < j && nums[i] <= nums[left])
                i++;                // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
            swap(nums[i], nums[j]); // 두 원소를 교환한다
        }
        swap(nums[i], nums[left]);  // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
        return i;                   // 피벗의 인덱스를 반환한다
    }

  public:
    /* 퀵 정렬 */
    static void quickSort(vector<int> &nums, int left, int right) {
        // 부분 배열의 길이가 1이면 재귀를 종료한다
        if (left >= right)
            return;
        // 센티널 분할
        int pivot = partition(nums, left, right);
        // 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* 퀵 정렬 클래스(중앙값 피벗 최적화) */
class QuickSortMedian {
  private:
    /* 세 후보 원소의 중앙값 선택 */
    static int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m은 l과 r 사이에 있다
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l은 m과 r 사이에 있다
        return right;
    }

    /* 센티널 분할(세 수의 중앙값 선택) */
    static int partition(vector<int> &nums, int left, int right) {
        // 세 후보 원소의 중앙값 선택
        int med = medianThree(nums, left, (left + right) / 2, right);
        // 중앙값을 배열 맨 왼쪽으로 교환하여 옮긴다
        swap(nums[left], nums[med]);
        // nums[left]를 피벗으로 삼는다
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
            while (i < j && nums[i] <= nums[left])
                i++;                // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
            swap(nums[i], nums[j]); // 두 원소를 교환한다
        }
        swap(nums[i], nums[left]);  // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
        return i;                   // 피벗의 인덱스를 반환한다
    }

  public:
    /* 퀵 정렬 */
    static void quickSort(vector<int> &nums, int left, int right) {
        // 부분 배열의 길이가 1이면 재귀를 종료한다
        if (left >= right)
            return;
        // 센티널 분할
        int pivot = partition(nums, left, right);
        // 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* 퀵 정렬 클래스(재귀 깊이 최적화) */
class QuickSortTailCall {
  private:
    /* 센티널 분할 */
    static int partition(vector<int> &nums, int left, int right) {
        // nums[left]를 피벗으로 삼는다
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
            while (i < j && nums[i] <= nums[left])
                i++;                // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
            swap(nums[i], nums[j]); // 두 원소를 교환한다
        }
        swap(nums[i], nums[left]);  // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
        return i;                   // 피벗의 인덱스를 반환한다
    }

  public:
    /* 퀵 정렬(재귀 깊이 최적화) */
    static void quickSort(vector<int> &nums, int left, int right) {
        // 부분 배열의 길이가 1이면 종료한다
        while (left < right) {
            // 센티널 분할 연산
            int pivot = partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬을 수행한다
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // 왼쪽 부분 배열을 재귀적으로 정렬한다
                left = pivot + 1;                 // 남은 미정렬 구간은 [pivot + 1, right]이다
            } else {
                quickSort(nums, pivot + 1, right); // 오른쪽 부분 배열을 재귀적으로 정렬한다
                right = pivot - 1;                 // 남은 미정렬 구간은 [left, pivot - 1]이다
            }
        }
    }
};

/* 실행 코드 */
int main() {
    /* 퀵 정렬 */
    vector<int> nums{2, 4, 1, 0, 3, 5};
    QuickSort::quickSort(nums, 0, nums.size() - 1);
    cout << "퀵 정렬을 마친 후 nums = ";
    printVector(nums);

    /* 퀵 정렬(중앙값 피벗 최적화) */
    vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    QuickSortMedian::quickSort(nums1, 0, nums1.size() - 1);
    cout << "퀵 정렬(중앙값 피벗 최적화)을 마친 후 nums = ";
    printVector(nums1);

    /* 퀵 정렬(재귀 깊이 최적화) */
    vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    QuickSortTailCall::quickSort(nums2, 0, nums2.size() - 1);
    cout << "퀵 정렬(재귀 깊이 최적화)을 마친 후 nums = ";
    printVector(nums2);

    return 0;
}
