/**
 * File: simple_hash.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

public class simple_hash {
    /* Аддитивное хеширование */
    static int addHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* Мультипликативное хеширование */
    static int mulHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (31 * hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* XOR-хеширование */
    static int xorHash(String key) {
        int hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash ^= (int) c;
        }
        return hash & MODULUS;
    }

    /* Вращательное хеширование */
    static int rotHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = ((hash << 4) ^ (hash >> 28) ^ (int) c) % MODULUS;
        }
        return (int) hash;
    }

    public static void main(String[] args) {
        String key = "Hello Algo";

        int hash = addHash(key);
        System.out.println("Аддитивное хешированиезначениеравно" + hash);

        hash = mulHash(key);
        System.out.println("Мультипликативное хешированиезначениеравно" + hash);

        hash = xorHash(key);
        System.out.println("XOR-хешированиезначениеравно" + hash);

        hash = rotHash(key);
        System.out.println("Вращательное хешированиезначениеравно" + hash);
    }
}
