/**
 * File: hanota.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import java.util.*;

public class hanota {
    /* 원판 하나 이동 */
    static void move(List<Integer> src, List<Integer> tar) {
        // src의 맨 위에서 원판 하나를 꺼낸다
        Integer pan = src.remove(src.size() - 1);
        // 원판을 tar의 맨 위에 놓는다
        tar.add(pan);
    }

    /* 하노이의 탑 문제 f(i) 풀기 */
    static void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
        dfs(i - 1, src, tar, buf);
        // 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
        move(src, tar);
        // 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
        dfs(i - 1, buf, src, tar);
    }

    /* 하노이의 탑 문제 풀기 */
    static void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
        dfs(n, A, B, C);
    }

    public static void main(String[] args) {
        // 리스트의 맨 뒤가 기둥의 맨 위이다
        List<Integer> A = new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));
        List<Integer> B = new ArrayList<>();
        List<Integer> C = new ArrayList<>();
        System.out.println("초기 상태:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);

        solveHanota(A, B, C);

        System.out.println("원판 이동을 마친 후:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);
    }
}
