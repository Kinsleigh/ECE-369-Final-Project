#  Team Members:   Kinsleigh Wong , Zahra Sadeq
#  % Effort    :   70 - 30
#
# ECE369A,  
# 

########################################################################################################################
### data
########################################################################################################################
.data
# test input
# asize : dimensions of the frame [i, j] and window [k, l]
#         i: number of rows,  j: number of cols
#         k: number of rows,  l: number of cols  
# frame : frame data with i*j number of pixel values
# window: search window with k*l number of pixel values
#
# $v0 is for row / $v1 is for column

# test 0 For the 16X16 frame size and 4X4 window size
# The result should be 12, 12
asize0: .word 64, 64, 4, 4
frame0: .word 255, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 251
.word 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 237, 250
.word 242, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 231, 236, 249
.word 243, 234, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 233, 230, 235, 248
.word 244, 235, 234, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 243, 232, 229, 234, 247
.word 245, 236, 235, 242, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 231, 242, 231, 228, 233, 246
.word 246, 237, 236, 243, 228, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 227, 230, 241, 230, 227, 232, 245
.word 247, 238, 237, 244, 229, 252, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 231, 226, 229, 240, 229, 226, 231, 244
.word 248, 239, 238, 245, 230, 253, 254, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 243, 230, 225, 228, 239, 228, 225, 230, 243
.word 249, 240, 239, 246, 231, 254, 225, 234, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 233, 242, 229, 254, 227, 238, 227, 254, 229, 242
.word 250, 241, 240, 247, 232, 225, 226, 235, 252, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 231, 232, 241, 228, 253, 226, 237, 226, 253, 228, 241
.word 251, 242, 241, 248, 233, 226, 227, 236, 253, 248, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 237, 230, 231, 240, 227, 252, 225, 236, 225, 252, 227, 240
.word 252, 243, 242, 249, 234, 227, 228, 237, 254, 249, 252, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 251, 236, 229, 230, 239, 226, 251, 254, 235, 254, 251, 226, 239
.word 253, 244, 243, 250, 235, 228, 229, 238, 225, 250, 253, 234, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 243, 250, 235, 228, 229, 238, 225, 250, 253, 234, 253, 250, 225, 238
.word 254, 245, 244, 251, 236, 229, 230, 239, 226, 251, 254, 235, 254, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 243, 242, 249, 234, 227, 228, 237, 254, 249, 252, 233, 252, 249, 254, 237
.word 225, 246, 245, 252, 237, 230, 231, 240, 227, 252, 225, 236, 225, 252, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 251, 242, 241, 248, 233, 226, 227, 236, 253, 248, 251, 232, 251, 248, 253, 236
.word 226, 247, 246, 253, 238, 231, 232, 241, 228, 253, 226, 237, 226, 253, 228, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 237, 250, 241, 240, 247, 232, 225, 226, 235, 252, 247, 250, 231, 250, 247, 252, 235
.word 227, 248, 247, 254, 239, 232, 233, 242, 229, 254, 227, 238, 227, 254, 229, 242, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 231, 236, 249, 240, 239, 246, 231, 254, 225, 234, 251, 246, 249, 230, 249, 246, 251, 234
.word 228, 249, 248, 225, 240, 233, 234, 243, 230, 225, 228, 239, 228, 225, 230, 243, 234, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 233, 230, 235, 248, 239, 238, 245, 230, 253, 254, 233, 250, 245, 248, 229, 248, 245, 250, 233
.word 229, 250, 249, 226, 241, 234, 235, 244, 231, 226, 229, 240, 229, 226, 231, 244, 235, 234, 240, 101, 101, 101, 101, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 243, 232, 229, 234, 247, 238, 237, 244, 229, 252, 253, 232, 249, 244, 247, 228, 247, 244, 249, 232
.word 230, 251, 250, 227, 242, 235, 236, 245, 232, 227, 230, 241, 230, 227, 232, 245, 236, 235, 242, 101, 101, 101, 101, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 231, 242, 231, 228, 233, 246, 237, 236, 243, 228, 251, 252, 231, 248, 243, 246, 227, 246, 243, 248, 231
.word 231, 252, 251, 228, 243, 236, 237, 246, 233, 228, 231, 242, 231, 228, 233, 246, 237, 236, 243, 101, 101, 101, 101, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 227, 230, 241, 230, 227, 232, 245, 236, 235, 242, 227, 250, 251, 230, 247, 242, 245, 226, 245, 242, 247, 230
.word 232, 253, 252, 229, 244, 237, 238, 247, 234, 229, 232, 243, 232, 229, 234, 247, 238, 237, 244, 101, 101, 101, 101, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 231, 226, 229, 240, 229, 226, 231, 244, 235, 234, 241, 226, 249, 250, 229, 246, 241, 244, 225, 244, 241, 246, 229
.word 233, 254, 253, 230, 245, 238, 239, 248, 235, 230, 233, 244, 233, 230, 235, 248, 239, 238, 245, 230, 253, 254, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 243, 230, 225, 228, 239, 228, 225, 230, 243, 234, 233, 240, 225, 248, 249, 228, 245, 240, 243, 254, 243, 240, 245, 228
.word 234, 225, 254, 231, 246, 239, 240, 249, 236, 231, 234, 245, 234, 231, 236, 249, 240, 239, 246, 231, 254, 225, 234, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 233, 242, 229, 254, 227, 238, 227, 254, 229, 242, 233, 232, 239, 254, 247, 248, 227, 244, 239, 242, 253, 242, 239, 244, 227
.word 235, 226, 225, 232, 247, 240, 241, 250, 237, 232, 235, 246, 235, 232, 237, 250, 241, 240, 247, 232, 225, 226, 235, 252, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 231, 232, 241, 228, 253, 226, 237, 226, 253, 228, 241, 232, 231, 238, 253, 246, 247, 226, 243, 238, 241, 252, 241, 238, 243, 226
.word 236, 227, 226, 233, 248, 241, 242, 251, 238, 233, 236, 247, 236, 233, 238, 251, 242, 241, 248, 233, 226, 227, 236, 253, 248, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 237, 230, 231, 240, 227, 252, 225, 236, 225, 252, 227, 240, 231, 230, 237, 252, 245, 246, 225, 242, 237, 240, 251, 240, 237, 242, 225
.word 237, 228, 227, 234, 249, 242, 243, 252, 239, 234, 237, 248, 237, 234, 239, 252, 243, 242, 249, 234, 227, 228, 237, 254, 249, 252, 232, 231, 230, 229, 228, 227, 226, 225, 254, 253, 251, 236, 229, 230, 239, 226, 251, 254, 235, 254, 251, 226, 239, 230, 229, 236, 251, 244, 245, 254, 241, 236, 239, 250, 239, 236, 241, 254
.word 238, 229, 228, 235, 250, 243, 244, 253, 240, 235, 238, 249, 238, 235, 240, 253, 244, 243, 250, 235, 228, 229, 238, 225, 250, 253, 234, 252, 251, 250, 249, 248, 247, 246, 245, 243, 250, 235, 228, 229, 238, 225, 250, 253, 234, 253, 250, 225, 238, 229, 228, 235, 250, 243, 244, 253, 240, 235, 238, 249, 238, 235, 240, 253
.word 239, 230, 229, 236, 251, 244, 245, 254, 241, 236, 239, 250, 239, 236, 241, 254, 245, 244, 251, 236, 229, 230, 239, 226, 251, 254, 235, 254, 250, 249, 248, 247, 246, 245, 243, 242, 249, 234, 227, 228, 237, 254, 249, 252, 233, 252, 249, 254, 237, 228, 227, 234, 249, 242, 243, 252, 239, 234, 237, 248, 237, 234, 239, 252
.word 240, 231, 230, 237, 252, 245, 246, 225, 242, 237, 240, 251, 240, 237, 242, 225, 246, 245, 252, 237, 230, 231, 240, 227, 252, 225, 236, 225, 252, 226, 225, 254, 253, 251, 242, 241, 248, 233, 226, 227, 236, 253, 248, 251, 232, 251, 248, 253, 236, 227, 226, 233, 248, 241, 242, 251, 238, 233, 236, 247, 236, 233, 238, 251
.word 241, 232, 231, 238, 253, 246, 247, 226, 243, 238, 241, 252, 241, 238, 243, 226, 247, 246, 253, 238, 231, 232, 241, 228, 253, 226, 237, 226, 253, 228, 240, 239, 237, 250, 241, 240, 247, 232, 225, 226, 235, 252, 247, 250, 231, 250, 247, 252, 235, 226, 225, 232, 247, 240, 241, 250, 237, 232, 235, 246, 235, 232, 237, 250
.word 242, 233, 232, 239, 254, 247, 248, 227, 244, 239, 242, 253, 242, 239, 244, 227, 248, 247, 254, 239, 232, 233, 242, 229, 254, 227, 238, 227, 254, 229, 101, 100, 100, 100, 100, 120, 246, 231, 254, 225, 234, 251, 246, 249, 230, 249, 246, 251, 234, 225, 254, 231, 246, 239, 240, 249, 236, 231, 234, 245, 234, 231, 236, 249
.word 243, 234, 233, 240, 225, 248, 249, 228, 245, 240, 243, 254, 243, 240, 245, 228, 249, 248, 225, 240, 233, 234, 243, 230, 225, 228, 239, 228, 225, 230, 120, 100, 100, 100, 100, 120, 245, 230, 253, 254, 233, 250, 245, 248, 229, 248, 245, 250, 233, 254, 253, 230, 245, 238, 239, 248, 235, 230, 233, 244, 233, 230, 235, 248
.word 244, 235, 234, 241, 226, 249, 250, 229, 246, 241, 244, 225, 244, 241, 246, 229, 250, 249, 226, 241, 234, 235, 244, 231, 226, 229, 240, 229, 226, 231, 120, 100, 100, 100, 100, 120, 244, 229, 252, 253, 232, 249, 244, 247, 228, 247, 244, 249, 232, 253, 252, 229, 244, 237, 238, 247, 234, 229, 232, 243, 232, 229, 234, 247
.word 245, 236, 235, 242, 227, 250, 251, 230, 247, 242, 245, 226, 245, 242, 247, 230, 251, 250, 227, 242, 235, 236, 245, 232, 227, 230, 241, 230, 227, 229, 120, 100, 100, 100, 100, 120, 243, 228, 251, 252, 231, 248, 243, 246, 227, 246, 243, 248, 231, 252, 251, 228, 243, 236, 237, 246, 233, 228, 231, 242, 231, 228, 233, 246
.word 246, 237, 236, 243, 228, 251, 252, 231, 248, 243, 246, 227, 246, 243, 248, 231, 252, 251, 228, 243, 236, 237, 246, 233, 228, 231, 242, 231, 233, 234, 120, 120, 120, 120, 239, 240, 241, 227, 250, 251, 230, 247, 242, 245, 226, 245, 242, 247, 230, 251, 250, 227, 242, 235, 236, 245, 232, 227, 230, 241, 230, 227, 232, 245
.word 247, 238, 237, 244, 229, 252, 253, 232, 249, 244, 247, 228, 247, 244, 249, 232, 253, 252, 229, 244, 237, 238, 247, 234, 229, 232, 243, 245, 246, 247, 120, 120, 120, 101, 252, 253, 254, 225, 249, 250, 229, 246, 241, 244, 225, 244, 241, 246, 229, 250, 249, 226, 241, 234, 235, 244, 231, 226, 229, 240, 229, 226, 231, 244
.word 248, 239, 238, 245, 230, 253, 254, 233, 250, 245, 248, 229, 248, 245, 250, 233, 254, 253, 230, 245, 238, 239, 248, 235, 230, 233, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 249, 228, 245, 240, 243, 254, 243, 240, 245, 228, 249, 248, 225, 240, 233, 234, 243, 230, 225, 228, 239, 228, 225, 230, 243
.word 249, 240, 239, 246, 231, 254, 225, 234, 251, 246, 249, 230, 249, 246, 251, 234, 225, 254, 231, 246, 239, 240, 249, 236, 231, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 227, 244, 239, 242, 253, 242, 239, 244, 227, 248, 247, 254, 239, 232, 233, 242, 229, 254, 227, 238, 227, 254, 229, 242
.word 250, 241, 240, 247, 232, 225, 226, 235, 252, 247, 250, 231, 250, 247, 252, 235, 226, 225, 232, 247, 240, 241, 250, 237, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 243, 238, 241, 252, 241, 238, 243, 226, 247, 246, 253, 238, 231, 232, 241, 228, 253, 226, 237, 226, 253, 228, 241
.word 251, 242, 241, 248, 233, 226, 227, 236, 253, 248, 251, 232, 251, 248, 253, 236, 227, 226, 233, 248, 241, 242, 251, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 237, 240, 251, 240, 237, 242, 225, 246, 245, 252, 237, 230, 231, 240, 227, 252, 225, 236, 225, 252, 227, 240
.word 252, 243, 242, 249, 234, 227, 228, 237, 254, 249, 252, 233, 252, 249, 254, 237, 228, 227, 234, 249, 242, 243, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 239, 250, 239, 236, 241, 254, 245, 244, 251, 236, 229, 230, 239, 226, 251, 254, 235, 254, 251, 226, 239
.word 253, 244, 243, 250, 235, 228, 229, 238, 225, 250, 253, 234, 253, 250, 225, 238, 229, 228, 235, 250, 243, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 249, 238, 235, 240, 253, 244, 243, 250, 235, 228, 229, 238, 225, 250, 253, 234, 253, 250, 225, 238
.word 254, 245, 244, 251, 236, 229, 230, 239, 226, 251, 254, 235, 254, 251, 226, 239, 230, 229, 236, 251, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 237, 234, 239, 252, 243, 242, 249, 234, 227, 228, 237, 254, 249, 252, 233, 252, 249, 254, 237
.word 225, 246, 245, 252, 237, 230, 231, 240, 227, 252, 225, 236, 225, 252, 227, 240, 231, 230, 237, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 233, 238, 251, 242, 241, 248, 233, 226, 227, 236, 253, 248, 251, 232, 251, 248, 253, 236
.word 226, 247, 246, 253, 238, 231, 232, 241, 228, 253, 226, 237, 226, 253, 228, 241, 232, 231, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 237, 250, 241, 240, 247, 232, 225, 226, 235, 252, 247, 250, 231, 250, 247, 252, 235
.word 227, 248, 247, 254, 239, 232, 233, 242, 229, 254, 227, 238, 227, 254, 229, 242, 233, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 249, 240, 239, 246, 231, 254, 225, 234, 251, 246, 249, 230, 249, 246, 251, 234
.word 228, 249, 248, 225, 240, 233, 234, 243, 230, 225, 228, 239, 228, 225, 230, 243, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 239, 238, 245, 230, 253, 254, 233, 250, 245, 248, 229, 248, 245, 250, 233
.word 229, 250, 249, 226, 241, 234, 235, 244, 231, 226, 229, 240, 229, 226, 231, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 237, 244, 229, 252, 253, 232, 249, 244, 247, 228, 247, 244, 249, 232
.word 230, 251, 250, 227, 242, 235, 236, 245, 232, 227, 230, 241, 230, 227, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 243, 102, 102, 102, 102, 248, 243, 246, 227, 246, 243, 248, 231
.word 231, 252, 251, 228, 243, 236, 237, 246, 233, 228, 231, 242, 231, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 102, 102, 102, 102, 247, 242, 245, 226, 245, 242, 247, 230
.word 232, 253, 252, 229, 244, 237, 238, 247, 234, 229, 232, 243, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 102, 102, 102, 102, 246, 241, 244, 225, 244, 241, 246, 229
.word 233, 254, 253, 230, 245, 238, 239, 248, 235, 230, 233, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 102, 102, 102, 102, 245, 240, 243, 254, 243, 240, 245, 228
.word 234, 225, 254, 231, 246, 239, 240, 249, 236, 231, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 227, 244, 239, 242, 253, 242, 239, 244, 227
.word 235, 226, 225, 232, 247, 240, 241, 250, 237, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 243, 238, 241, 252, 241, 238, 243, 226
.word 236, 227, 226, 233, 248, 241, 242, 251, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 237, 240, 251, 240, 237, 242, 225
.word 237, 228, 227, 234, 249, 242, 243, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 239, 250, 239, 236, 241, 254
.word 238, 229, 228, 235, 250, 243, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 249, 238, 235, 240, 253
.word 239, 230, 229, 236, 251, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 237, 234, 239, 252
.word 240, 231, 230, 237, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 233, 238, 251
.word 241, 232, 231, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 237, 250
.word 242, 233, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 249
.word 243, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247
window0: .word 99, 99, 99, 99
	.word 99, 99, 99, 99
	.word 99, 99, 99, 99
	.word 99, 99, 99, 99


########################################################################################################################
### main
########################################################################################################################

.text

.globl main

main: 
         
    # Start test 1 
    ############################################################
    la      $a0, asize0     # 1st parameter: address of asize1[0]
    la      $a1, frame0     # 2nd parameter: address of frame1[0]
    la      $a2, window0    # 3rd parameter: address of window1[0] 

    li      $v0, 0              # reset $v0 and $V1
    li      $v1, 0

    # insert your code here
	lw $t9, 0($a0) #So we get the # of rows for the frame.	
	lw $s2, 8($a0) #We get the number of rows for the window.	
	addi $t0, $t9, 1 
	sub $t0, $t0, $s2 #We calculate the value for how many times we iterate row-wise.	
	lw $s0, 4($a0) #Now, we get the # of cols for the frame. Also, s0 is used because we need this value. 
	lw $s3, 12($a0) #We get the # of cols for the window.
	addi $t1, $s0, 1 # y = FRAME_Y + 1
	sub $t1, $t1, $s3 #We calculate the value for how many times we iterate -wise. 	y
	add $t2, $zero, $zero #This is potato
	add $t3, $zero, $zero #$t3 and $t4 will represent our iterators.
	add $t4, $zero, $zero 
		#initialize s4 here
	addi $s4, $zero, 32767
	addi $s4, $s4, 32513
	slt $t9, $t1, $t0
	bne $t9, $zero, repeat2
	repeat1:
		add $t5, $t3, $t1
		horizontalright:
			add $t6, $t2, $t3
			sll $t6, $t6, 2
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			jal sad
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			addi $t3, $t3, 1
			bne $t3, $t5, horizontalright
		addi $t1, $t1, -1
		addi $t3, $t3, -1
		add $t5, $t4, $t0
		addi $t0, $t0, -1
		beq $t0, $zero, pete
		addi $t4, $t4, 1
		verticaldown:
			add $t2, $t2, $s0
			add $t6, $t2, $t3
			sll $t6, $t6, 2
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			jal sad
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			addi $t4, $t4, 1
			bne $t4, $t5, verticaldown
		addi $t4, $t4, -1
		addi $t3, $t3, -1
		sub $t5, $t3, $t1
		horizontalleft:
			add $t6, $t2, $t3
			sll $t6, $t6, 2
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			jal sad
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			addi $t3, $t3, -1
			bne $t3, $t5, horizontalleft
		addi $t3, $t3, 1
		addi $t1, $t1, -1
		sub $t5, $t4, $t0 
		addi $t0, $t0, -1
		beq $t0, $zero, pete
		addi $t4, $t4, -1
		verticalup:
			sub $t2, $t2, $s0
			add $t6, $t2, $t3
			sll $t6, $t6, 2
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			jal sad
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			addi $t4, $t4, -1
			bne $t4, $t5, verticalup
		addi $t3, $t3, 1
		addi $t4, $t4, 1	
		j repeat1
	repeat2:
		add $t5, $t3, $t1
		horizontalright2:
			add $t6, $t2, $t3
			sll $t6, $t6, 2
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			jal sad
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			addi $t3, $t3, 1
			bne $t3, $t5, horizontalright2
		addi $t1, $t1, -1
		addi $t3, $t3, -1
		add $t5, $t4, $t0
		addi $t0, $t0, -1
		addi $t4, $t4, 1
		verticaldown2:
			add $t2, $t2, $s0
			add $t6, $t2, $t3
			sll $t6, $t6, 2
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			jal sad
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			addi $t4, $t4, 1
			bne $t4, $t5, verticaldown2
		beq $t1, $zero, pete
		addi $t4, $t4, -1
		addi $t3, $t3, -1
		sub $t5, $t3, $t1
		horizontalleft2:
			add $t6, $t2, $t3
			sll $t6, $t6, 2
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			jal sad
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			addi $t3, $t3, -1
			bne $t3, $t5, horizontalleft2
		addi $t3, $t3, 1
		addi $t1, $t1, -1
		sub $t5, $t4, $t0 
		addi $t0, $t0, -1
		addi $t4, $t4, -1
		verticalup2:
			sub $t2, $t2, $s0
			add $t6, $t2, $t3
			sll $t6, $t6, 2
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			jal sad
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			addi $t4, $t4, -1
			bne $t4, $t5, verticalup2
		beq $t1, $zero, pete
		addi $t3, $t3, 1
		addi $t4, $t4, 1	
		j repeat2
		pete: #end of program
			j pete

	sad:
		addi $sp, $sp, -4
		sw $s4, 0($sp)
		add $s4, $a1, $t6 #Holding the location of the frame
		add $s5, $a2, $zero #holding the location of the window
		add $s6, $s3, $zero #s6 will hold the difference between two elements
		add $s7, $zero, $zero #s7 will hold the current sum
		add $s1, $zero, $zero #This variable will be used to move the frame to the next row.
		add $t7, $zero, $zero 
		loop1:
			add $t8, $zero, $zero #t8 is used to iterate through the columns of a row. 
			loop2:	
				lw $t9, 0($s4)
				addi $s4, $s4, 4
				add $s6, $t9, $zero
				lw $t9, 0($s5)
				addi $s5, $s5, 4 
				sub $s6, $s6, $t9
				#do absolute value thing here. Allowed to use pseudo-instruction abs?
				#abs $s6, $s6
				sra $t9, $s6, 31
				xor $s6, $s6, $t9
				sub $s6, $s6, $t9
				add $s7, $s7, $s6
				addi $t8, $t8, 1
				bne $t8, $s3, loop2
			addi $t7, $t7, 1
			beq $t7, $s2, donezo
			add $s1, $s1, $s0
			sll $t9, $s1, 2
			add $t9, $t9, $t6
			add $s4, $t9, $a1 
			j loop1
		donezo:
			lw $s4, 0($sp)
			addi $sp, $sp, 4
			slt $t9, $s7, $s4
			bne $t9, $zero, change
			jr $ra
		change:
			add $v0, $t4, $zero
			add $v1, $t3, $zero
			add $s4, $s7, $zero
			jr $ra
		