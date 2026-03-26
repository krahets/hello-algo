/**
 * File: vertex.hpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <vector>

using namespace std;

/* Класс вершины */
struct Vertex {
    int val;
    Vertex(int x) : val(x) {
    }
};

/* Вход: список значений vals; вернуть список вершин vets */
vector<Vertex *> valsToVets(vector<int> vals) {
    vector<Vertex *> vets;
    for (int val : vals) {
        vets.push_back(new Vertex(val));
    }
    return vets;
}

/* Вход: список вершин vets; вернуть список значений vals */
vector<int> vetsToVals(vector<Vertex *> vets) {
    vector<int> vals;
    for (Vertex *vet : vets) {
        vals.push_back(vet->val);
    }
    return vals;
}
