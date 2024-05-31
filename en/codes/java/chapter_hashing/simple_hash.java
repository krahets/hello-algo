/**
 * File: simple_hash.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

public class simple_hash {
    /* Additive hash */
    static int addHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* Multiplicative hash */
    static int mulHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = (31 * hash + (int) c) % MODULUS;
        }
        return (int) hash;
    }

    /* XOR hash */
    static int xorHash(String key) {
        int hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash ^= (int) c;
        }
        return hash & MODULUS;
    }

    /* Rotational hash */
    static int rotHash(String key) {
        long hash = 0;
        final int MODULUS = 1000000007;
        for (char c : key.toCharArray()) {
            hash = ((hash << 4) ^ (hash >> 28) ^ (int) c) % MODULUS;
        }
        return (int) hash;
    }

    public static void main(String[] args) {
        String key = "Hello algorithm";

        int hash = addHash(key);
        System.out.println("Additive hash value is " + hash);

        hash = mulHash(key);
        System.out.println("Multiplicative hash value is " + hash);

        hash = xorHash(key);
        System.out.println("XOR hash value is " + hash);

        hash = rotHash(key);
        System.out.println("Rotational hash value is " + hash);
    }
}
