#include <stdio.h>

int main(int argc, char* argv[])
{
    int m =0;
    while (1)
    {
        int x;
        scanf("%d", &x);
        printf("%d\n", x);
        if (x == 777) break;
        m = x > m? x:m;
    }
    printf("maximum = %d", m);
}
