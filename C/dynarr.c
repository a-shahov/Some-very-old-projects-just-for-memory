#include <stdio.h>
#include <stdlib.h>

void arr_print(int **A, size_t N, size_t M)
{
    for(int i=0; i<N; ++i)
    {
        for(int j=0; j<M; ++j)
            printf("%3d", A[i][j]);
        printf("\n");
    }
}

void arr(size_t N, size_t M)
{
    int **A = (int**)malloc(N*sizeof(int*) + N*M*sizeof(int));
    int *start = (int*)((char*)A + N*sizeof(int*));
    int x = 1;
    for(int i=0; i<N; ++i)
    {
        A[i] = (start + i*M);
        for(int j=0; j<M; ++j)
        {
            A[i][j] = x*5;
            ++x;
        }

    }
    //printf("%d\n", *(int*)A[0]);
    //printf("%d\n", *((int*)A[0]+1));
    arr_print(A, N, M);
}

int main()
{
    arr(4, 4);

    return 0;
}
