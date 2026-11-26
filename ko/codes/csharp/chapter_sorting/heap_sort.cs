/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* 길이 n인 힙에서 노드 i부터 아래로 내려가며 힙 속성 복원 */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드를 ma에 기록
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나 더 진행할 필요가 없으면 종료
            if (ma == i)
                break;
            // 두 노드 교환
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // 아래로 내려가며 힙 속성 복원 반복
            i = ma;
        }
    }

    /* 힙 정렬 */
    void HeapSort(int[] nums) {
        // 힙 구성: 리프 노드를 제외한 모든 노드에서 힙 속성 복원
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // 힙에서 최댓값 추출을 n-1회 반복
        for (int i = nums.Length - 1; i > 0; i--) {
            // 루트 노드와 맨 오른쪽 리프 노드 교환(첫 원소와 마지막 원소 교환)
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // 루트 노드부터 아래로 내려가며 힙 속성 복원
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("힙 정렬 후 nums = " + string.Join(" ", nums));
    }
}
