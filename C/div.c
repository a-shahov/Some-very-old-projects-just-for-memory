#include <stdio.h>
#include <inttypes.h>

int main()
{
    int64_t x = 1263786387;
    while (x != 0)
    {
        printf("%d, %d\n", x/10, x%10);
        x /= 10;
    }
    x = -12;
    printf("%d\n", x%7);
}
