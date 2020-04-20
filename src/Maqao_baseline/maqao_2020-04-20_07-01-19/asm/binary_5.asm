0x1350::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: CALL	10b0 <sqrt@plt>
0x1355::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: JMP	13c0 <sobel_baseline+0x129>
0x1357::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:84::Insn: MOV	%AL,(%R13,%RBP,1)
0x135c::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:77::Insn: INC	%RBP
0x135f::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:77::Insn: CMP	$0xefd,%RBP
0x1366::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:77::Insn: JE	13db <sobel_baseline+0x144>
0x1368::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:79::Insn: LEA	(%RBP,%R12,1),%R15
0x136d::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:79::Insn: LEA	0x40(%RSP),%RSI
0x1372::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:79::Insn: MOV	$0x3,%ECX
0x1377::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:79::Insn: MOV	$0x3,%EDX
0x137c::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:79::Insn: MOV	%R15,%RDI
0x137f::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:79::Insn: CALL	1241 <convolve_baseline>
0x1384::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:79::Insn: MOV	%EAX,%EBX
0x1386::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:80::Insn: LEA	0x10(%RSP),%RSI
0x138b::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:80::Insn: MOV	$0x3,%ECX
0x1390::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:80::Insn: MOV	$0x3,%EDX
0x1395::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:80::Insn: MOV	%R15,%RDI
0x1398::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:80::Insn: CALL	1241 <convolve_baseline>
0x139d::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: IMUL	%EBX,%EBX
0x13a0::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: IMUL	%EAX,%EAX
0x13a3::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: ADD	%EAX,%EBX
0x13a5::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: VXORPD	%XMM1,%XMM1,%XMM1
0x13a9::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: VCVTSI2SD	%EBX,%XMM1,%XMM0
0x13ad::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: VSQRTSD	%XMM0,%XMM0,%XMM2
0x13b1::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: VMOVSD	%XMM2,(%RSP)
0x13b6::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: VXORPD	%XMM3,%XMM3,%XMM3
0x13ba::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: VUCOMISD	%XMM0,%XMM3
0x13be::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: JA	1350 <sobel_baseline+0xb9>
0x13c0::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:82::Insn: VCVTSD2SS	(%RSP),%XMM0,%XMM0
0x13c5::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:84::Insn: MOV	$-0x1,%EAX
0x13ca::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:84::Insn: VCOMISS	0xc(%RSP),%XMM0
0x13d0::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:84::Insn: JA	1357 <sobel_baseline+0xc0>
0x13d2::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:84::Insn: VCVTTSS2SI	%XMM0,%EAX
0x13d6::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:84::Insn: JMP	1357 <sobel_baseline+0xc0>
