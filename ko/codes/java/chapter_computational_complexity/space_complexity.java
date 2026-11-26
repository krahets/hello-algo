/**
 * File: space_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import utils.*;
import java.util.*;

public class space_complexity {
    /* 함수 */
    static int function() {
        // 어떤 연산을 수행한다
        return 0;
    }

    /* 상수 차수 */
    static void constant(int n) {
        // 상수, 변수, 객체가 O(1)의 공간을 차지한다
        final int a = 0;
        int b = 0;
        int[] nums = new int[10000];
        ListNode node = new ListNode(0);
        // 반복문 안의 변수가 O(1)의 공간을 차지한다
        for (int i = 0; i < n; i++) {
            int c = 0;
        }
        // 반복문 안의 함수가 O(1)의 공간을 차지한다
        for (int i = 0; i < n; i++) {
            function();
        }
    }

    /* 선형 차수 */
    static void linear(int n) {
        // 길이 n인 배열이 O(n)의 공간을 차지한다
        int[] nums = new int[n];
        // 길이 n인 리스트가 O(n)의 공간을 차지한다
        List<ListNode> nodes = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            nodes.add(new ListNode(i));
        }
        // 길이 n인 해시 테이블이 O(n)의 공간을 차지한다
        Map<Integer, String> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            map.put(i, String.valueOf(i));
        }
    }

    /* 선형 차수(재귀 구현) */
    static void linearRecur(int n) {
        System.out.println("재귀 호출 n = " + n);
        if (n == 1)
            return;
        linearRecur(n - 1);
    }

    /* 이차 차수 */
    static void quadratic(int n) {
        // 행렬이 O(n^2)의 공간을 차지한다
        int[][] numMatrix = new int[n][n];
        // 2차원 리스트가 O(n^2)의 공간을 차지한다
        List<List<Integer>> numList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> tmp = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                tmp.add(0);
            }
            numList.add(tmp);
        }
    }

    /* 이차 차수(재귀 구현) */
    static int quadraticRecur(int n) {
        if (n <= 0)
            return 0;
        // 배열 nums의 길이는 차례로 n, n-1, ..., 2, 1이다
        int[] nums = new int[n];
        System.out.println("재귀 호출 n = " + n + " 에서 nums의 길이 = " + nums.length);
        return quadraticRecur(n - 1);
    }

    /* 지수 차수(포화 이진 트리 생성) */
    static TreeNode buildTree(int n) {
        if (n == 0)
            return null;
        TreeNode root = new TreeNode(0);
        root.left = buildTree(n - 1);
        root.right = buildTree(n - 1);
        return root;
    }

    /* 실행 예제 */
    public static void main(String[] args) {
        int n = 5;
        // 상수 차수
        constant(n);
        // 선형 차수
        linear(n);
        linearRecur(n);
        // 이차 차수
        quadratic(n);
        quadraticRecur(n);
        // 지수 차수
        TreeNode root = buildTree(n);
        PrintUtil.printTree(root);
    }
}
