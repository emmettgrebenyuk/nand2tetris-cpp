// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(CHECKLOOP)
@SCREEN
D=A
@R10
M=D
@KBD
D=M
@DRAWLOOP
D;JGT
@CLEARLOOP
D;JEQ

(DRAWLOOP)
@R10
A=M
M=-1
@R10
DM=M+1
@KBD
D=A-D
@CHECKLOOP
D;JEQ
@DRAWLOOP
0;JMP

(CLEARLOOP)
@R10
A=M
M=0
@R10
DM=M+1
@KBD
D=A-D
@CHECKLOOP
D;JEQ
@CLEARLOOP
0;JMP