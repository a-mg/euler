/* 006:
 *
 * The sum of the squares of the first ten natural numbers is,
 *     1^2 + 2^2 + ... + 10^2 = 385
 *
 * The square of the sum of the first ten natural numbers is,
 *     (1 + 2 + ... + 10)^2 = 552 = 3025
 *
 * Hence the difference between the sum of the squares of the first ten natural
 * numbers and the square of the sum is 3025 − 385 = 2640.
 *
 * Find the difference between the sum of the squares of the first one hundred
 * natural numbers and the square of the sum.
 */

#include <iostream>
using namespace std;

const int MAX = 100;

int main() {
    // sum of the squares
    int sum_squares = 0;
    for (int i = 1; i <= MAX; i++) {
        sum_squares += i * i;
    }

    // square of the sum
    int square_sum = 0;
    for (int i = 1; i <= MAX; i++) {
        square_sum += i;
    }
    square_sum *= square_sum;

    // difference
    cout << (square_sum - sum_squares) << endl;
    return 0;
}
