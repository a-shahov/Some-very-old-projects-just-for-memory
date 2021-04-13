#include <stdio.h>

void print_number_factors(int x)
{
    int divisor = 2;
    while (x != 1)
    {
        if (x%divisor == 0)
        {
            printf("%d\n", divisor);
            x /= divisor;
        }
        else
            ++divisor;
    }
}

int main()
{
    int x;
    scanf("%d", &x);
    print_number_factors(x);

    return 0;
}
