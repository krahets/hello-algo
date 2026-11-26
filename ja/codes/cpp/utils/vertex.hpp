/**
 * File: vertex.hpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <vector>

using namespace std;

/* 頂点を表すクラス */
struct Vertex {
    int val;
    Vertex(int x) : val(x) {
    }
};

/* 値のリスト vals を受け取り、頂点のリスト vets を返す */
vector<Vertex *> valsToVets(vector<int> vals) {
    vector<Vertex *> vets;
    for (int val : vals) {
        vets.push_back(new Vertex(val));
    }
    return vets;
}

/* 頂点のリスト vets を受け取り、値のリスト vals を返す */
vector<int> vetsToVals(vector<Vertex *> vets) {
    vector<int> vals;
    for (Vertex *vet : vets) {
        vals.push_back(vet->val);
    }
    return vals;
}
