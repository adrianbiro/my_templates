
function num_nullpad(num,pad){
    # set default number for padding to 3, as local var, if no number is specified.
    pad = (pad == "") ? 3 : pad
    # It is intended for  numbering, so dedcimal point is ignored.
    return sprintf("%0"pad".f", num)
}


# BEGIN {
#     printf("%09.3f\n", 4917.24);  # 04917.240
#     printf("%08.3f\n", 4917.24);  # 4917.240
#     printf("%08.2f\n", 4917.24);  # 04917.24
#     printf("%08.f\n", 4917.24);  # 00004917
#     printf("%03.f\n", 17);  # 017
#     print num_nullpad(5,3)  # 005
#     print num_nullpad(5,8)  # 00000005
#     print num_nullpad(15)  # 015
#     print num_nullpad(1,2)  # 01
#     print num_nullpad(5.123456,3)  # 005  - no decimal
# }



















