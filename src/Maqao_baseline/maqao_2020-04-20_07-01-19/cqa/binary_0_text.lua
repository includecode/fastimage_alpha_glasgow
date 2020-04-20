_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCVTSD2SS: 1 occurrences\n - VCVTSI2SD: 3 occurrences\n - VCVTTSS2SI: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Use double instead of single precision only when/where needed by numerical stability and avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - VCVTSD2SS: 1 occurrences\n - VCVTSI2SD: 3 occurrences\n - VCVTTSS2SI: 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions (typically from/to single/double precision).",
        },
        {
          title = "Type of elements and instruction set",
          txt = "5 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 5 FP arithmetical operations:\n - 2: addition or subtraction\n - 3: multiply\nThe binary loop is loading 3 bytes (0 double precision FP elements).\nThe binary loop is storing 3 bytes (0 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.83 FP operations per loaded or stored byte.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor and if some data references are common to consecutive iterations. This can be done manually. Or by recompiling with -funroll-loops and/or -floop-unroll-and-jam.",
          title = "Unroll opportunity",
          txt = "Loop is potentially data access bound.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 11e2\n\nInstruction                        | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------\nMOVZX (%RDI),%EAX                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 1       | 0.50\nVCVTSI2SD %EAX,%XMM2,%XMM0         | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0    | 6       | 2\nVMULSD %XMM5,%XMM0,%XMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nMOVZX 0x1(%RDI),%EAX               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 1       | 0.50\nVCVTSI2SD %EAX,%XMM2,%XMM1         | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0    | 6       | 2\nVMULSD %XMM4,%XMM1,%XMM1           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVADDSD %XMM1,%XMM0,%XMM1           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nMOVZX 0x2(%RDI),%EAX               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 1       | 0.50\nVCVTSI2SD %EAX,%XMM2,%XMM0         | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0    | 6       | 2\nVMULSD %XMM3,%XMM0,%XMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVADDSD %XMM0,%XMM1,%XMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVCVTSD2SS %XMM0,%XMM0,%XMM0        | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0    | 5       | 1\nVCVTTSS2SI %XMM0,%EAX              | 2     | 1    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 6       | 1\nMOV %AL,(%RDI)                     | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %AL,0x1(%RDI)                  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %AL,0x2(%RDI)                  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nADD $0x3,%RDI                      | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCMP %RDX,%RDI                      | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE 11e2 <grayscale_weighted+0x23> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 19\nnb uops            : 23\nloop length        : 68\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 6\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 0.67\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 5.75 cycles\nfront end            : 5.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 5.50 | 5.50 | 2.17 | 1.83 | 3.00 | 4.00 | 2.00 | 2.00\ncycles | 5.50 | 5.50 | 2.17 | 1.83 | 3.00 | 4.00 | 2.00 | 2.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 5.75\nDispatch  : 5.50\nData deps.: 1.00\nOverall L1: 5.75\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\nFP\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 0%\nadd-sub: 0%\nother  : 0%\nINT+FP\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 0%\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 12%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 12%\nFP\nall    : 23%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 25%\nadd-sub: 25%\nother  : 18%\nINT+FP\nall    : 18%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 25%\nadd-sub: 25%\nother  : 15%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 5.75 cycles. At this rate:\n - 0% of peak load performance is reached (0.52 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (0.52 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n",
        },
      },
      header = {
        "5% of peak computational performance is used (0.87 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one:\n  * recompile with ftree-vectorize (included in O3) to enable loop vectorization and with fassociative-math (included in Ofast or ffast-math) to extend vectorization to FP reductions.\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly:\nC storage order is row-major: for(i) for(j) a[j][i] = b[j][i]; (slow, non stride 1) => for(i) for(j) a[i][j] = b[i][j]; (fast, stride 1)\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 18% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 5.75 to 1.06 cycles (5.41x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Presence of both ADD/SUB and MUL operations.",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - VCVTSD2SS: 1 occurrences\n - VCVTSI2SD: 3 occurrences\n - VCVTTSS2SI: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Use double instead of single precision only when/where needed by numerical stability and avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - VCVTSD2SS: 1 occurrences\n - VCVTSI2SD: 3 occurrences\n - VCVTTSS2SI: 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions (typically from/to single/double precision).",
        },
        {
          title = "Type of elements and instruction set",
          txt = "5 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 5 FP arithmetical operations:\n - 2: addition or subtraction\n - 3: multiply\nThe binary loop is loading 3 bytes (0 double precision FP elements).\nThe binary loop is storing 3 bytes (0 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.83 FP operations per loaded or stored byte.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor and if some data references are common to consecutive iterations. This can be done manually. Or by recompiling with -funroll-loops and/or -floop-unroll-and-jam.",
          title = "Unroll opportunity",
          txt = "Loop is potentially data access bound.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 11e2\n\nInstruction                        | Nb FU | P0   | P1   | P2   | P3   | P4 | P5   | P6   | P7   | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------\nMOVZX (%RDI),%EAX                  | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 1       | 0.50\nVCVTSI2SD %EAX,%XMM2,%XMM0         | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0    | 6       | 2\nVMULSD %XMM5,%XMM0,%XMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nMOVZX 0x1(%RDI),%EAX               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 1       | 0.50\nVCVTSI2SD %EAX,%XMM2,%XMM1         | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0    | 6       | 2\nVMULSD %XMM4,%XMM1,%XMM1           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVADDSD %XMM1,%XMM0,%XMM1           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nMOVZX 0x2(%RDI),%EAX               | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0    | 0    | 0    | 1       | 0.50\nVCVTSI2SD %EAX,%XMM2,%XMM0         | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0    | 6       | 2\nVMULSD %XMM3,%XMM0,%XMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVADDSD %XMM0,%XMM1,%XMM0           | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0    | 0    | 0    | 4       | 0.50\nVCVTSD2SS %XMM0,%XMM0,%XMM0        | 2     | 0.50 | 0.50 | 0    | 0    | 0  | 1    | 0    | 0    | 5       | 1\nVCVTTSS2SI %XMM0,%EAX              | 2     | 1    | 1    | 0    | 0    | 0  | 0    | 0    | 0    | 6       | 1\nMOV %AL,(%RDI)                     | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %AL,0x1(%RDI)                  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nMOV %AL,0x2(%RDI)                  | 1     | 0    | 0    | 0.33 | 0.33 | 1  | 0    | 0    | 0.33 | 3       | 1\nADD $0x3,%RDI                      | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nCMP %RDX,%RDI                      | 1     | 0.25 | 0.25 | 0    | 0    | 0  | 0.25 | 0.25 | 0    | 1       | 0.25\nJNE 11e2 <grayscale_weighted+0x23> | 1     | 0.50 | 0    | 0    | 0    | 0  | 0    | 0.50 | 0    | 0       | 0.50-1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 19\nnb uops            : 23\nloop length        : 68\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 6\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\nADD-SUB / MUL ratio: 0.67\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 5.75 cycles\nfront end            : 5.75 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 5.50 | 5.50 | 2.17 | 1.83 | 3.00 | 4.00 | 2.00 | 2.00\ncycles | 5.50 | 5.50 | 2.17 | 1.83 | 3.00 | 4.00 | 2.00 | 2.00\n\nCycles executing div or sqrt instructions: NA\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 5.75\nDispatch  : 5.50\nData deps.: 1.00\nOverall L1: 5.75\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\nFP\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 0%\nadd-sub: 0%\nother  : 0%\nINT+FP\nall    : 0%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 0%\nadd-sub: 0%\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 12%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 12%\nFP\nall    : 23%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 25%\nadd-sub: 25%\nother  : 18%\nINT+FP\nall    : 18%\nload   : 12%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : 25%\nadd-sub: 25%\nother  : 15%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 5.75 cycles. At this rate:\n - 0% of peak load performance is reached (0.52 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 1% of peak store performance is reached (0.52 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n",
        },
      },
      header = {
        "5% of peak computational performance is used (0.87 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one:\n  * recompile with ftree-vectorize (included in O3) to enable loop vectorization and with fassociative-math (included in Ofast or ffast-math) to extend vectorization to FP reductions.\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly:\nC storage order is row-major: for(i) for(j) a[j][i] = b[j][i]; (slow, non stride 1) => for(i) for(j) a[i][j] = b[i][j]; (fast, stride 1)\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 18% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 5.75 to 1.06 cycles (5.41x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
        {
          workaround = "Try to change order in which elements are evaluated (using parentheses) in arithmetic expressions containing both ADD/SUB and MUL operations to enable your compiler to generate FMA instructions wherever possible.\nFor instance a + b*c is a valid FMA (MUL then ADD).\nHowever (a+b)* c cannot be translated into an FMA (ADD then MUL).",
          title = "FMA",
          txt = "Presence of both ADD/SUB and MUL operations.",
        },
      },
    },
  common = {
    header = {
      "The loop is defined in /home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:20-29.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
