/**
 * File: Vertex.dart
 * Created Time: 2023-05-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 정점 클래스 */
class Vertex {
  int val;
  Vertex(this.val);

  /* 값의 리스트 vals를 입력받아 정점 리스트 vets 반환 */
  static List<Vertex> valsToVets(List<int> vals) {
    List<Vertex> vets = [];
    for (int i in vals) {
      vets.add(Vertex(i));
    }
    return vets;
  }

  /* 정점 리스트 vets를 입력받아 값의 리스트 vals 반환 */
  static List<int> vetsToVals(List<Vertex> vets) {
    List<int> vals = [];
    for (Vertex vet in vets) {
      vals.add(vet.val);
    }
    return vals;
  }
}
