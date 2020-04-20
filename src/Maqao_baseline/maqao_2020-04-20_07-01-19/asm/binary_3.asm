0x1261::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:56::Insn: MOVZX	(%R9,%RAX,1),%ESI
0x1266::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:56::Insn: IMUL	(%R8,%RAX,4),%ESI
0x126b::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:56::Insn: ADD	%ESI,%EDI
0x126d::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:55::Insn: INC	%RAX
0x1270::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:55::Insn: CMP	%RAX,%RCX
0x1273::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:55::Insn: JNE	1261 <convolve_baseline+0x20>
0x1275::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:54::Insn: INC	%R10
0x1278::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:54::Insn: ADD	%RCX,%R9
0x127b::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:54::Insn: ADD	%R11,%R8
0x127e::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:54::Insn: CMP	%R10,%RDX
0x1281::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:54::Insn: JE	1294 <convolve_baseline+0x53>
0x1283::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:55::Insn: MOV	$0,%EAX
0x1288::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:55::Insn: TEST	%RCX,%RCX
0x128b::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:55::Insn: JNE	1261 <convolve_baseline+0x20>
0x128d::/home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:55::Insn: JMP	1275 <convolve_baseline+0x34>
