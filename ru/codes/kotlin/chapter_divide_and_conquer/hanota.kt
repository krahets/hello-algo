/**
 * File: hanota.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.hanota

/* Перенос одного диска */
fun move(src: MutableList<Int>, tar: MutableList<Int>) {
    // Снимаем верхний диск с src
    val pan = src.removeAt(src.size - 1)
    // Кладём диск на вершину tar
    tar.add(pan)
}

/* Решение задачи о ханойских башнях f(i) */
fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
    // Если с src осталось перенести один диск, кладём его сразу на tar
    if (i == 1) {
        move(src, tar)
        return
    }
    // Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
    dfs(i - 1, src, tar, buf)
    // Подзадача f(1): переносим оставшийся диск с src на tar
    move(src, tar)
    // Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
    dfs(i - 1, buf, src, tar)
}

/* Решение задачи о ханойских башнях */
fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
    val n = A.size
    // Переносим n верхних дисков с A на C с помощью B
    dfs(n, A, B, C)
}

/* Основная программа */
fun main() {
    // Последний элемент списка соответствует вершине стержня
    val A = mutableListOf(5, 4, 3, 2, 1)
    val B = mutableListOf<Int>()
    val C = mutableListOf<Int>()
    println("Исходное состояние:")
    println("A = $A")
    println("B = $B")
    println("C = $C")

    solveHanota(A, B, C)

    println("После переноса дисков:")
    println("A = $A")
    println("B = $B")
    println("C = $C")
}