#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

extern void imgCvtGrayDoubleToInt(double** doubleArray, uint8_t** uInt8Array, int row, int col);

int main(void) {
    int row, col;
    scanf("%d %d", &row, &col);

    double **doubleArray = malloc(row * sizeof *doubleArray);
    uint8_t **uInt8Array = malloc(row * sizeof *uInt8Array);

    for (int i = 0; i < row; i++){
        doubleArray[i] = malloc(col * sizeof *doubleArray[i]);
        uInt8Array[i] = malloc(col * sizeof *uInt8Array[i]);

        for (int j = 0; j < col; j++)
            scanf("%lf", &doubleArray[i][j]);
    }

    imgCvtGrayDoubleToInt(doubleArray, uInt8Array, row, col);

    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) printf("%d ", uInt8Array[i][j]);
        printf("\n");
    }


    return 0;
}
