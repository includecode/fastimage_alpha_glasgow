_group = {
  {
    group_size = 6,
    pattern = "LLLSSS",
    opcodes = "MOVZX,MOVZX,MOVZX,MOV,MOV,MOV,",
    offsets = "0,1,2,0,1,2,",
    addresses = "0x11e2,0x11ed,0x11fd,0x1215,0x1217,0x121a,",
    stride_status = "Success",
    stride = 3,
    memory_status = "Success",
    accessed_memory = 6,
    accessed_memory_nooverlap = 3,
    accessed_memory_overlap = 3,
    span = 3,
    head = 3,
    unroll_factor = 3,
  },
}
