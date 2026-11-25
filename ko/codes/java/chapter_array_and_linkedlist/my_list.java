/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* 리스트 클래스 */
class MyList {
    private int[] arr; // 배열(리스트 원소 저장)
    private int capacity = 10; // 리스트 용량
    private int size = 0; // 리스트 길이(현재 원소 수)
    private int extendRatio = 2; // 리스트 용량을 늘릴 때마다 적용하는 배수

    /* 생성자 */
    public MyList() {
        arr = new int[capacity];
    }

    /* 리스트 길이(현재 원소 수) 구하기 */
    public int size() {
        return size;
    }

    /* 리스트 용량 구하기 */
    public int capacity() {
        return capacity;
    }

    /* 원소 접근 */
    public int get(int index) {
        // 인덱스가 범위를 벗어나면 예외를 던진다. 이하에서도 같다.
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("인덱스 범위 초과");
        return arr[index];
    }

    /* 원소 갱신 */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("인덱스 범위 초과");
        arr[index] = num;
    }

    /* 맨 뒤에 원소 추가 */
    public void add(int num) {
        // 원소 수가 용량을 초과하면 용량을 늘린다.
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // 원소 수 갱신
        size++;
    }

    /* 중간에 원소 삽입 */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("인덱스 범위 초과");
        // 원소 수가 용량을 초과하면 용량을 늘린다.
        if (size == capacity())
            extendCapacity();
        // 인덱스 index부터 끝까지 원소를 뒤로 한 칸씩 이동
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // 원소 수 갱신
        size++;
    }

    /* 원소 삭제 */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("인덱스 범위 초과");
        int num = arr[index];
        // 인덱스 index 다음의 원소를 모두 앞으로 한 칸씩 이동
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // 원소 수 갱신
        size--;
        // 삭제한 원소 반환
        return num;
    }

    /* 리스트 용량 늘리기 */
    public void extendCapacity() {
        // 원래 배열 길이의 extendRatio배인 새 배열을 만들고 원래 배열을 복사
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // 리스트 용량 갱신
        capacity = arr.length;
    }

    /* 리스트를 배열로 변환 */
    public int[] toArray() {
        int size = size();
        // 유효한 길이 범위 안의 리스트 원소만 변환
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* 실행 예제 */
    public static void main(String[] args) {
        /* 리스트 초기화 */
        MyList nums = new MyList();
        /* 맨 뒤에 원소 추가 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("리스트 nums = " + Arrays.toString(nums.toArray()) +
                " , 용량 = " + nums.capacity() + " , 길이 = " + nums.size());

        /* 중간에 원소 삽입 */
        nums.insert(3, 6);
        System.out.println("인덱스 3에 숫자 6을 삽입한 후 nums = " + Arrays.toString(nums.toArray()));

        /* 원소 삭제 */
        nums.remove(3);
        System.out.println("인덱스 3의 원소를 삭제한 후 nums = " + Arrays.toString(nums.toArray()));

        /* 원소 접근 */
        int num = nums.get(1);
        System.out.println("인덱스 1의 원소를 읽은 결과 num = " + num);

        /* 원소 갱신 */
        nums.set(1, 0);
        System.out.println("인덱스 1의 원소를 0으로 바꾼 후 nums = " + Arrays.toString(nums.toArray()));

        /* 용량 확장 동작 테스트 */
        for (int i = 0; i < 10; i++) {
            // i = 5일 때 리스트 길이가 용량을 초과하게 되어 용량 확장이 일어난다.
            nums.add(i);
        }
        System.out.println("용량 확장 후 리스트 nums = " + Arrays.toString(nums.toArray()) +
                " , 용량 = " + nums.capacity() + " , 길이 = " + nums.size());
    }
}
