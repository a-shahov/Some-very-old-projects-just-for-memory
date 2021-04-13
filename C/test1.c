#include <stdio.h>
#include <inttypes.h>

//Что тут происходит???
int main(int argc, char* argv[])
{

    while (1)
    {
        int x;
        scanf("%d", &x);
        if (x == 666)
            break;
        printf("draw... %d\n", x);
    }

    return 0;
}
