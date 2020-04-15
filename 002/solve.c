#include <stdio.h>

int main() {
    int a   = 1;  // term n - 2
    int b   = 2;  // term n - 1
    int sum = 0;  // sum

    while (b < 4000000) {
        if (b % 2 == 0)
            sum += b;

        // calculate next term
        int c = a + b;
        a = b;
        b = c;
    }

    printf("%d\n", sum);
    return 0;
}
