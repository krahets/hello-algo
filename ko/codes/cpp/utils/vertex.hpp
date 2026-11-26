/**
 * File: vertex.hpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <vector>

using namespace std;

/* 정점 클래스 */
struct Vertex {
    int val;
    Vertex(int x) : val(x) {
    }
};

/* 값 리스트 vals를 받아 정점 리스트 vets를 반환한다. */
vector<Vertex *> valsToVets(vector<int> vals) {
    vector<Vertex *> vets;
    for (int val : vals) {
        vets.push_back(new Vertex(val));
    }
    return vets;
}

/* 정점 리스트 vets를 받아 값 리스트 vals를 반환한다. */
vector<int> vetsToVals(vector<Vertex *> vets) {
    vector<int> vals;
    for (Vertex *vet : vets) {
        vals.push_back(vet->val);
    }
    return vals;
}
