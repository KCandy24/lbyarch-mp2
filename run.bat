nasm -f win64 imgCvtGrayDoubleToInt.asm -o imgCvtGrayDoubleToInt.o
gcc AndaKCasaLmp2.c imgCvtGrayDoubleToInt.o -o AndaKCasaLmp2.exe -g
AndaKCasaLmp2.exe < input.txt
