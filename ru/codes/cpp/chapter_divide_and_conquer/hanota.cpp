/**
 * File: hanota.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Переместить один диск */
void move(vector<int> &src, vector<int> &tar) {
    // Снять диск с вершины src
    int pan = src.back();
    src.pop_back();
    // Положить диск на вершину tar
    tar.push_back(pan);
}

/* Решить задачу Ханойской башни f(i) */
void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
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
void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
    int n = A.size();
    // Переместить верхние n дисков из A в C с помощью B
    dfs(n, A, B, C);
}

/* Driver Code */
int main() {
    // Хвост списка соответствует вершине столбца
    vector<int> A = {5, 4, 3, 2, 1};
    vector<int> B = {};
    vector<int> C = {};

    cout << "Начальное состояние:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    solveHanota(A, B, C);

    cout << "После завершения перемещения дисков:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    return 0;
}
