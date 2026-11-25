/**
 * File: simple_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Аддитивное хеширование */
int addHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* Мультипликативное хеширование */
int mulHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* Хеширование с помощью XOR */
int xorHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash ^= key.codeUnitAt(i);
  }
  return hash & MODULUS;
}

/* Хеширование с циклическим сдвигом */
int rotHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = ((hash << 4) ^ (hash >> 28) ^ key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* Демонстрационный код */
void main() {
  String key = "Hello 算法";

  int hash = addHash(key);
  print("Аддитивный хеш: $hash");

  hash = mulHash(key);
  print("Мультипликативный хеш: $hash");

  hash = xorHash(key);
  print("Хеш на основе XOR: $hash");

  hash = rotHash(key);
  print("Хеш с циклическим сдвигом: $hash");
}
