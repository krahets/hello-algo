/**
* File: hanota.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class hanota {
    /* Перенос одного диска */
    void Move(List<int> src, List<int> tar) {
        // Снимаем верхний диск с src
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // Кладём диск на вершину tar
        tar.Add(pan);
    }

    /* Решение задачи о ханойских башнях f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // Если с src осталось перенести один диск, кладём его сразу на tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
        DFS(i - 1, src, tar, buf);
        // Подзадача f(1): переносим оставшийся диск с src на tar
        Move(src, tar);
        // Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
        DFS(i - 1, buf, src, tar);
    }

    /* Решение задачи о ханойских башнях */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // Переносим n верхних дисков с A на C с помощью B
        DFS(n, A, B, C);
    }

    [Test]
    public void Test() {
        // Последний элемент списка соответствует вершине стержня
        List<int> A = [5, 4, 3, 2, 1];
        List<int> B = [];
        List<int> C = [];
        Console.WriteLine("Исходное состояние:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));

        SolveHanota(A, B, C);

        Console.WriteLine("После переноса дисков:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));
    }
}
