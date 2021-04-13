#include <stdlib.h>
#include <inttypes.h>
#include <stdio.h>

int main()
{
    int N, i;
    scanf("%d", &N);
    char *A = (char *)malloc(N);

    for(i=0; i<N; ++i)
        A[i] = i;

    printf("Array successfully created\n");
    system("pause");
    return 0;
}
