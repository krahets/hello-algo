/**
* File: hanota.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class hanota {
    /* Переместить один диск */
    void Move(List<int> src, List<int> tar) {
        // Снять диск с вершины src
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // Положить диск на вершину tar
        tar.Add(pan);
    }

    /* Решить задачу Ханойской башни f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // Если в src остался только один диск, сразу переместить его в tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
        DFS(i - 1, src, tar, buf);
        // Подзадача f(1): переместить оставшийся один диск из src в tar
        Move(src, tar);
        // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
        DFS(i - 1, buf, src, tar);
    }

    /* Решить задачу Ханойской башни */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // Переместить верхние n дисков из A в C с помощью B
        DFS(n, A, B, C);
    }

    [Test]
    public void Test() {
        // Хвост списка соответствует вершине столбца
        List<int> A = [5, 4, 3, 2, 1];
        List<int> B = [];
        List<int> C = [];
        Console.WriteLine("Исходное состояние:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));

        SolveHanota(A, B, C);

        Console.WriteLine("После завершения перемещения дисков:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));
    }
}
