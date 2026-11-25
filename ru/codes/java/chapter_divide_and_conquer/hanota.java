/**
 * File: hanota.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import java.util.*;

public class hanota {
    /* Перенос одного диска */
    static void move(List<Integer> src, List<Integer> tar) {
        // Снимаем верхний диск с src
        Integer pan = src.remove(src.size() - 1);
        // Кладём диск на вершину tar
        tar.add(pan);
    }

    /* Решение задачи о ханойских башнях f(i) */
    static void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // Если с src осталось перенести один диск, кладём его сразу на tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
        dfs(i - 1, src, tar, buf);
        // Подзадача f(1): переносим оставшийся диск с src на tar
        move(src, tar);
        // Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
        dfs(i - 1, buf, src, tar);
    }

    /* Решение задачи о ханойских башнях */
    static void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // Переносим n верхних дисков с A на C с помощью B
        dfs(n, A, B, C);
    }

    public static void main(String[] args) {
        // Последний элемент списка соответствует вершине стержня
        List<Integer> A = new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));
        List<Integer> B = new ArrayList<>();
        List<Integer> C = new ArrayList<>();
        System.out.println("Исходное состояние:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);

        solveHanota(A, B, C);

        System.out.println("После переноса дисков:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);
    }
}
