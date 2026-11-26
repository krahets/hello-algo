/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* 임의의 원소에 접근 */
    static int randomAccess(int[] nums) {
        // 구간 [0, nums.length)에서 수 하나를 무작위로 선택
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // 선택한 원소를 가져와 반환
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 배열 길이 늘리기 */
    static int[] extend(int[] nums, int enlarge) {
        // 길이를 늘린 새 배열 초기화
        int[] res = new int[nums.length + enlarge];
        // 원래 배열의 모든 원소를 새 배열에 복사
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 길이를 늘린 새 배열 반환
        return res;
    }

    /* 배열의 인덱스 index에 원소 num 삽입 */
    static void insert(int[] nums, int num, int index) {
        // 인덱스 index부터 끝까지 모든 원소를 뒤로 한 칸씩 이동
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 인덱스 index의 원소에 num 대입
        nums[index] = num;
    }

    /* 인덱스 index의 원소 삭제 */
    static void remove(int[] nums, int index) {
        // 인덱스 index 다음의 모든 원소를 앞으로 한 칸씩 이동
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 배열 순회 */
    static void traverse(int[] nums) {
        int count = 0;
        // 인덱스로 배열 순회
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 배열 원소를 직접 순회
        for (int num : nums) {
            count += num;
        }
    }

    /* 배열에서 지정한 원소 찾기 */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* 실행 예제 */
    public static void main(String[] args) {
        /* 배열 초기화 */
        int[] arr = new int[5];
        System.out.println("배열 arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("배열 nums = " + Arrays.toString(nums));

        /* 임의 접근 */
        int randomNum = randomAccess(nums);
        System.out.println("nums에서 무작위로 선택한 원소: " + randomNum);

        /* 길이 늘리기 */
        nums = extend(nums, 3);
        System.out.println("길이를 8로 늘린 배열 nums = " + Arrays.toString(nums));

        /* 원소 삽입 */
        insert(nums, 6, 3);
        System.out.println("인덱스 3에 숫자 6을 삽입한 후 nums = " + Arrays.toString(nums));

        /* 원소 삭제 */
        remove(nums, 2);
        System.out.println("인덱스 2의 원소를 삭제한 후 nums = " + Arrays.toString(nums));

        /* 배열 순회 */
        traverse(nums);

        /* 원소 찾기 */
        int index = find(nums, 3);
        System.out.println("nums에서 원소 3을 찾은 인덱스 = " + index);
    }
}
