_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function does not load or store any data.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 11f8\n\nInstruction             | Nb FU | P0 | P1   | P2   | P3   | P4 | P5   | P6 | P7   | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------\nLEA 0xa8c00(%RDI),%RDX  | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nMOV %RDI,%RAX           | 1     | 0  | 0    | 0    | 0    | 0  | 0    | 0  | 0    | 0       | 0.25\nLEA 0xa8c00(%RDI),%RAX  | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x151800(%RDI),%RDX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x151800(%RDI),%RAX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x1fa400(%RDI),%RDX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x1fa400(%RDI),%RAX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x2a3000(%RDI),%RDX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nRET                     | 1     | 0  | 0    | 0.33 | 0.33 | 0  | 0    | 1  | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 9\nnb uops            : 9\nloop length        : 53\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 2.25 cycles\nfront end            : 2.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 0.00 | 3.50 | 0.33 | 0.33 | 0.00 | 3.50 | 1.00 | 0.33\ncycles | 0.00 | 3.50 | 0.33 | 0.33 | 0.00 | 3.50 | 1.00 | 0.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.25\nDispatch  : 3.50\nOverall L1: 3.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 3.50 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your function, you can lower the cost of an iteration from 3.50 to 0.88 cycles (4.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function does not load or store any data.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 11f8\n\nInstruction             | Nb FU | P0 | P1   | P2   | P3   | P4 | P5   | P6 | P7   | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------\nLEA 0xa8c00(%RDI),%RDX  | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nMOV %RDI,%RAX           | 1     | 0  | 0    | 0    | 0    | 0  | 0    | 0  | 0    | 0       | 0.25\nLEA 0xa8c00(%RDI),%RAX  | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x151800(%RDI),%RDX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x151800(%RDI),%RAX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x1fa400(%RDI),%RDX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x1fa400(%RDI),%RAX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nLEA 0x2a3000(%RDI),%RDX | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nRET                     | 1     | 0  | 0    | 0.33 | 0.33 | 0  | 0    | 1  | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 9\nnb uops            : 9\nloop length        : 53\nused x86 registers : 3\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 2.25 cycles\nfront end            : 2.25 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 0.00 | 3.50 | 0.33 | 0.33 | 0.00 | 3.50 | 1.00 | 0.33\ncycles | 0.00 | 3.50 | 0.33 | 0.33 | 0.00 | 3.50 | 1.00 | 0.33\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.25\nDispatch  : 3.50\nOverall L1: 3.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 25%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 3.50 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 4.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\n4 data elements could be processed at once in vector registers.\nBy vectorizing your function, you can lower the cost of an iteration from 3.50 to 0.88 cycles (4.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "The function is defined in /home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/invert_unrolled.c:30-179.\n",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}
