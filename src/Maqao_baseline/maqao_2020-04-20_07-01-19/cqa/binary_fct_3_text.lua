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
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 24 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 11bf\n\nInstruction              | Nb FU | P0 | P1   | P2   | P3   | P4 | P5   | P6 | P7   | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------\nVXORPS %XMM2,%XMM2,%XMM2 | 1     | 0  | 0    | 0    | 0    | 0  | 0    | 0  | 0    | 0       | 0.25\nLEA 0x2a3000(%RDI),%RDX  | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nVMOVSD 0xef6(%RIP),%XMM5 | 1     | 0  | 0    | 0.50 | 0.50 | 0  | 0    | 0  | 0    | 0       | 0.50\nVMOVSD 0xef6(%RIP),%XMM4 | 1     | 0  | 0    | 0.50 | 0.50 | 0  | 0    | 0  | 0    | 0       | 0.50\nVMOVSD 0xef6(%RIP),%XMM3 | 1     | 0  | 0    | 0.50 | 0.50 | 0  | 0    | 0  | 0    | 0       | 0.50\nRET                      | 1     | 0  | 0    | 0.33 | 0.33 | 0  | 0    | 1  | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 6\nnb uops            : 6\nloop length        : 36\nused x86 registers : 2\nused mmx registers : 0\nused xmm registers : 4\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 1.50 cycles\nfront end            : 1.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 0.00 | 0.50 | 1.50 | 1.50 | 0.00 | 0.50 | 1.00 | 1.00\ncycles | 0.00 | 0.50 | 1.50 | 1.50 | 0.00 | 0.50 | 1.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.50\nDispatch  : 1.50\nOverall L1: 1.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 25%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 31%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 1.50 cycles. At this rate:\n - 25% of peak load performance is reached (16.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 1.50 to 1.00 cycles (1.50x speedup).\n",
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
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 31% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 1.50 to 0.38 cycles (4.00x speedup).",
        },
        {
          workaround = " - Read less array elements\n - Provide more information to your compiler:\n  * use the 'restrict' C99 keyword\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 1.50 to 1.00 cycles (1.50x speedup).\n",
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
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 24 bytes.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 11bf\n\nInstruction              | Nb FU | P0 | P1   | P2   | P3   | P4 | P5   | P6 | P7   | Latency | Recip. throughput\n----------------------------------------------------------------------------------------------------------------\nVXORPS %XMM2,%XMM2,%XMM2 | 1     | 0  | 0    | 0    | 0    | 0  | 0    | 0  | 0    | 0       | 0.25\nLEA 0x2a3000(%RDI),%RDX  | 1     | 0  | 0.50 | 0    | 0    | 0  | 0.50 | 0  | 0    | 1       | 0.50\nVMOVSD 0xef6(%RIP),%XMM5 | 1     | 0  | 0    | 0.50 | 0.50 | 0  | 0    | 0  | 0    | 0       | 0.50\nVMOVSD 0xef6(%RIP),%XMM4 | 1     | 0  | 0    | 0.50 | 0.50 | 0  | 0    | 0  | 0    | 0       | 0.50\nVMOVSD 0xef6(%RIP),%XMM3 | 1     | 0  | 0    | 0.50 | 0.50 | 0  | 0    | 0  | 0    | 0       | 0.50\nRET                      | 1     | 0  | 0    | 0.33 | 0.33 | 0  | 0    | 1  | 0.33 | 0       | 1\n",
        },
        {
          title = "General properties",
          txt = "nb instructions    : 6\nnb uops            : 6\nloop length        : 36\nused x86 registers : 2\nused mmx registers : 0\nused xmm registers : 4\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 1.50 cycles\nfront end            : 1.50 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7\n--------------------------------------------------------------\nuops   | 0.00 | 0.50 | 1.50 | 1.50 | 0.00 | 0.50 | 1.00 | 1.00\ncycles | 0.00 | 0.50 | 1.50 | 1.50 | 0.00 | 0.50 | 1.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.50\nDispatch  : 1.50\nOverall L1: 1.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all    : 25%\nload   : 0%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all    : 31%\nload   : 25%\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nother  : 50%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 1.50 cycles. At this rate:\n - 25% of peak load performance is reached (16.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 1.50 to 1.00 cycles (1.50x speedup).\n",
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
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 31% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 1.50 to 0.38 cycles (4.00x speedup).",
        },
        {
          workaround = " - Read less array elements\n - Provide more information to your compiler:\n  * use the 'restrict' C99 keyword\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by reading data from caches/RAM (load units are a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 1.50 to 1.00 cycles (1.50x speedup).\n",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "The function is defined in /home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/sobel.c:17-31.\n",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}
