//Program name: "Triangle".  This program takes two sides of a triangle to determine the third side *
//some basic math operations using float numbers.  Copyright (C) 2025 Joanna Alyssa Menghamal.                                        *
//                                                                                                                           *
//This file is part of the software program "Triangle".                                                        *
//Triangle is a free software: you can redistribute it and/or modify it under the terms of the GNU General Public*
//License version 3 as published by the Free Software Foundation.                                                            *
//Triangle is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the       *
//implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more      *
//details.  A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                  *
//****************************************************************
//
//Author information
//  Author name: Joanna Alyssa Menghamal
//  Author email: jmenghamal@csu.fullerton.edu
//
//Program information
//  Program name: Triangle
//  Programming languages: One modules in C and one module in X86
//  Date program began: 2025-Jan-26
//  Date of last update: 
//  Date comments upgraded: 2025-Jan-26
//  Date open source license added: 2025-Jan-26
//  Date Basic Float Operations 2.0 released: 2020-November-6
//  Files in this program: geometry.c triangle.asm
//  Status: Finished.
//  References consulted: Seyfarth, Chapter 11
//  Future upgrade possible: software to validate inputs and reject non-float inputs
//
//Purpose
//  This program will demonstrate how to determine the third side of a triangle. 
//
//This file
//  File name: geometry.c
//  Language: C
//  Max page width: 132 columns  [132 column width may not be strictly adhered to.]
//  Compile this file: g++ -c -m64 -Wall -o fp-io-driver.o fp-io-driver.cpp -fno-pie -no-pie -std=c++17
//     [As the time of upgrade to this program C++ standard 2020 was not available.]
//  Link this program: gcc -m64 -o geometry.out geometry.o -fno-pie -no-pie -o geometry.out geometry.o


//This main function includes two header files, which both enable I/O functions in this same C++ function.

//===== Begin code area ========================================================
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

extern void triangle();

int main() 
{
  printf("Welcome to the Triangle Program maintained by Joanna Menghamal.\n\n");
  printf("\nIf errors are discovered please report them to Joanna Menghamal at jmenghamal@csu.fullerton.edu for a quick  fix.");
  triangle();
  printf("\nGoodbye! ");
  return 0;
}

