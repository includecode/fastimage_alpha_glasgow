_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>NOT: 32 occurrences</li></ul>",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This loop is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is loading 32 bytes.\nThe binary loop is storing 32 bytes.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor and if some data references are common to consecutive iterations. This can be done manually. Or by recompiling with -funroll-loops and/or -floop-unroll-and-jam.",
          title = "Unroll opportunity",
          txt = "Loop is data access bound.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1278\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>NOTB (%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x2(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x3(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x4(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x5(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x6(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x7(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x8(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x9(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xa(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xb(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xc(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xd(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xe(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xf(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x10(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x11(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x12(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x13(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x14(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x15(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x16(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x17(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x18(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x19(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1a(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1b(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1c(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1d(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1e(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1f(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>ADD $0x20,%RAX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>CMP %RDX,%RAX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JNE 1278 <process_unrolled+0x80></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0.50-1</td></tr></table>",
        },
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>35</td></tr><tr><td>nb uops</td><td>98</td></tr><tr><td>loop length</td><td>104</td></tr><tr><td>used x86 registers</td><td>2</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>0</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>24.50 cycles</td></tr><tr><td>front end</td><td>24.50 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th></tr><tr><td>uops</td><td>8.50</td><td>8.50</td><td>21.33</td><td>21.33</td><td>32.00</td><td>8.50</td><td>8.50</td><td>21.33</td></tr><tr><td>cycles</td><td>8.50</td><td>8.50</td><td>21.33</td><td>21.33</td><td>32.00</td><td>8.50</td><td>8.50</td><td>21.33</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>1.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>24.50</td></tr><tr><td>Dispatch</td><td>32.00</td></tr><tr><td>Data deps.</td><td>1.00</td></tr><tr><td>Overall L1</td><td>32.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "<table><tr><td>all</td><td>3%</td></tr><tr><td>load</td><td>3%</td></tr><tr><td>store</td><td>3%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n<ul><li>1% of peak load performance is reached (1.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>3% of peak store performance is reached (1.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
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
          workaround = "<ul><li>Try another compiler or update/tune your current one:\n<ul><li>recompile with ftree-vectorize (included in O3) to enable loop vectorization and with fassociative-math (included in Ofast or ffast-math) to extend vectorization to FP reductions.</li></ul></li><li>Remove inter-iterations dependences from your loop and make it unit-stride:\n<ul><li>If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly:\nC storage order is row-major: for(i) for(j) a[j][i] = b[j][i]; (slow, non stride 1) =&gt; for(i) for(j) a[i][j] = b[i][j]; (fast, stride 1)</li><li>If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) =&gt; for(i) a.x[i] = b.x[i]; (fast, stride 1)</li></ul></li></ul>",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 3% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 32.00 to 1.00 cycles (32.00x speedup).",
        },
        {
          workaround = "<ul><li>Write less array elements</li><li>Provide more information to your compiler:\n<ul><li>hardcode the bounds of the corresponding 'for' loop</li><li>use the 'restrict' C99 keyword</li></ul></li></ul>",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by writing data to caches/RAM (the store unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 32.00 to 24.50 cycles (1.31x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>NOT: 32 occurrences</li></ul>",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This loop is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is loading 32 bytes.\nThe binary loop is storing 32 bytes.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor and if some data references are common to consecutive iterations. This can be done manually. Or by recompiling with -funroll-loops and/or -floop-unroll-and-jam.",
          title = "Unroll opportunity",
          txt = "Loop is data access bound.",
        },
      },
      expert = {
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1278\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>NOTB (%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x2(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x3(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x4(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x5(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x6(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x7(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x8(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x9(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xa(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xb(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xc(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xd(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xe(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0xf(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x10(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x11(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x12(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x13(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x14(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x15(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x16(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x17(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x18(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x19(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1a(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1b(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1c(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1d(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1e(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>NOTB 0x1f(%RAX)</td><td>3</td><td>0.25</td><td>0.25</td><td>0.83</td><td>0.83</td><td>1</td><td>0.25</td><td>0.25</td><td>0.33</td><td>5</td><td>1</td></tr><tr><td>ADD $0x20,%RAX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>CMP %RDX,%RAX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JNE 1278 <process_unrolled+0x80></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0.50-1</td></tr></table>",
        },
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>35</td></tr><tr><td>nb uops</td><td>98</td></tr><tr><td>loop length</td><td>104</td></tr><tr><td>used x86 registers</td><td>2</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>0</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>24.50 cycles</td></tr><tr><td>front end</td><td>24.50 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th></tr><tr><td>uops</td><td>8.50</td><td>8.50</td><td>21.33</td><td>21.33</td><td>32.00</td><td>8.50</td><td>8.50</td><td>21.33</td></tr><tr><td>cycles</td><td>8.50</td><td>8.50</td><td>21.33</td><td>21.33</td><td>32.00</td><td>8.50</td><td>8.50</td><td>21.33</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>1.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>24.50</td></tr><tr><td>Dispatch</td><td>32.00</td></tr><tr><td>Data deps.</td><td>1.00</td></tr><tr><td>Overall L1</td><td>32.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "<table><tr><td>all</td><td>3%</td></tr><tr><td>load</td><td>3%</td></tr><tr><td>store</td><td>3%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 32.00 cycles. At this rate:\n<ul><li>1% of peak load performance is reached (1.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>3% of peak store performance is reached (1.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
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
          workaround = "<ul><li>Try another compiler or update/tune your current one:\n<ul><li>recompile with ftree-vectorize (included in O3) to enable loop vectorization and with fassociative-math (included in Ofast or ffast-math) to extend vectorization to FP reductions.</li></ul></li><li>Remove inter-iterations dependences from your loop and make it unit-stride:\n<ul><li>If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly:\nC storage order is row-major: for(i) for(j) a[j][i] = b[j][i]; (slow, non stride 1) =&gt; for(i) for(j) a[i][j] = b[i][j]; (fast, stride 1)</li><li>If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) =&gt; for(i) a.x[i] = b.x[i]; (fast, stride 1)</li></ul></li></ul>",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 3% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 32.00 to 1.00 cycles (32.00x speedup).",
        },
        {
          workaround = "<ul><li>Write less array elements</li><li>Provide more information to your compiler:\n<ul><li>hardcode the bounds of the corresponding 'for' loop</li><li>use the 'restrict' C99 keyword</li></ul></li></ul>",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by writing data to caches/RAM (the store unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 32.00 to 24.50 cycles (1.31x speedup).\n",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "The loop is defined in /home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/invert_unrolled.c:71-105.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}
