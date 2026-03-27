/**
 * File: hanota.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import java.util.*;

public class hanota {
    /* Переместить один диск */
    static void move(List<Integer> src, List<Integer> tar) {
        // Снять диск с вершины src
        Integer pan = src.remove(src.size() - 1);
        // Положить диск на вершину tar
        tar.add(pan);
    }

    /* Решить задачу Ханойской башни f(i) */
    static void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // Если в src остался только один диск, сразу переместить его в tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        dfs(i - 1, src, tar, buf);
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        move(src, tar);
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        dfs(i - 1, buf, src, tar);
    }

    /* Решить задачу Ханойской башни */
    static void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // Переместить верхние n дисков из A в C с помощью B
        dfs(n, A, B, C);
    }

    public static void main(String[] args) {
        // Хвост списка соответствует вершине столбца
        List<Integer> A = new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));
        List<Integer> B = new ArrayList<>();
        List<Integer> C = new ArrayList<>();
        System.out.println("Исходное состояние:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);

        solveHanota(A, B, C);

        System.out.println("После завершения перемещения дисков:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);
    }
}
