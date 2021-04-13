#include <stdio.h>

int main()
{
    int x = -100;
    unsigned int y = 100I;
    long long int z = x + y;
    printf("%lld\n", z);

    char c = 'ß';
    printf("%d\n", (int)c);
}
