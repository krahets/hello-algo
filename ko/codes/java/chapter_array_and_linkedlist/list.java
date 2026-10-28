/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* 리스트 초기화 */
        // 배열의 원소 형식에는 int[]의 래퍼 형식인 Integer[]를 사용한다는 점에 주의한다
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("리스트 nums = " + nums);

        /* 원소 접근 */
        int num = nums.get(1);
        System.out.println("인덱스 1의 원소에 접근하여 얻은 num = " + num);

        /* 원소 갱신 */
        nums.set(1, 0);
        System.out.println("인덱스 1의 원소를 0으로 갱신한 후 nums = " + nums);

        /* 리스트 비우기 */
        nums.clear();
        System.out.println("리스트를 비운 후 nums = " + nums);

        /* 맨 뒤에 원소 추가 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("원소를 추가한 후 nums = " + nums);

        /* 중간에 원소 삽입 */
        nums.add(3, 6);
        System.out.println("인덱스 3에 숫자 6을 삽입한 후 nums = " + nums);

        /* 원소 삭제 */
        nums.remove(3);
        System.out.println("인덱스 3의 원소를 삭제한 후 nums = " + nums);

        /* 인덱스를 통해 리스트를 순회한다 */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* 리스트의 원소를 직접 순회한다 */
        for (int x : nums) {
            count += x;
        }

        /* 두 리스트 연결 */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("리스트 nums1을 nums 뒤에 연결한 후 nums = " + nums);

        /* 리스트 정렬 */
        Collections.sort(nums);
        System.out.println("리스트를 정렬한 후 nums = " + nums);
    }
}
