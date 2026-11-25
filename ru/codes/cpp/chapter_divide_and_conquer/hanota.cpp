/**
 * File: hanota.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Перенос одного диска */
void move(vector<int> &src, vector<int> &tar) {
    // Снимаем верхний диск с src
    int pan = src.back();
    src.pop_back();
    // Кладём диск на вершину tar
    tar.push_back(pan);
}

/* Решение задачи о ханойских башнях f(i) */
void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
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
void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
    int n = A.size();
    // Переносим n верхних дисков с A на C с помощью B
    dfs(n, A, B, C);
}

/* Основная программа */
int main() {
    // Последний элемент списка соответствует вершине стержня
    vector<int> A = {5, 4, 3, 2, 1};
    vector<int> B = {};
    vector<int> C = {};

    cout << "Исходное состояние:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    solveHanota(A, B, C);

    cout << "После переноса дисков:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    return 0;
}
