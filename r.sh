#!/bin/bash


#Author: Joanna Alyssa Menghamal
#Program name: Triangle length of side

rm -rf *.o
rm -rf *.out

echo "This is program <Triangle>"

echo "Assemble the module triangle.asm"
nasm -f elf64 -l triangle.lis -o triangle.o triangle.asm

echo "Compile the C module geometry.c"
gcc -m64 -Wall -no-pie -o geometry.o -std=c2x -c geometry.c

echo "Link the two object files already created"
gcc -m64 -no-pie -o geometry.out geometry.o triangle.o -std=c2x -Wall -z noexecstack -lm

echo "Run the program Triangle"

./geometry.out

echo "The bash script file is now closing."

