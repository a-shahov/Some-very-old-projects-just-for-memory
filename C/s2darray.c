#include <stdio.h>
#include <stdlib.h>

#define MTRX_WIDTH 5

void st_arr_print(int A[][MTRX_WIDTH], size_t N)
{
    for(int i=0; i<N; ++i)
    {
        for(int j=0; j<MTRX_WIDTH; ++j)
            printf("%5d", A[i][j]);
        printf("\n");
    }
}

void st_arr(size_t N)
{
    int A[N][MTRX_WIDTH];
    int x = 1;
    for(int i=0; i<N; ++i)
    {
        for(int j=0; j<MTRX_WIDTH; ++j)
        {
            A[i][j] = x * x;
            ++x;
        }
    }
    st_arr_print(A, N);

    printf("Direct memory access:\n");
    for(int *p = (int*)A; p < A + N; ++p)
        printf("%4d", *p);
}

int main()
{
    st_arr(6);

    return 0;
}
