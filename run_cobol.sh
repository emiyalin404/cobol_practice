#!/bin/bash

# 確認是否有提供檔案名稱
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <CobolProgramWithoutExtension>"
    exit 1
fi

# 編譯 COBOL 程序
cobc -x "$1.cob"

# 檢查編譯是否成功
if [ $? -eq 0 ]; then
    # 執行編譯後的程序
    ./"$1"
else
    echo "Compilation failed."
    exit 1
fi

# #!/bin/bash

# # 确认是否有提供文件名称
# if [ "$#" -ne 1 ]; then
#     echo "Usage: $0 <CobolProgramWithoutExtension>"
#     exit 1
# fi

# PROGRAM_NAME="$1"
# # 提取数字部分并确保以十进制处理
# NUM_PART=$(echo "$PROGRAM_NAME" | grep -o '[0-9]\+')
# # 将数字部分加3，确保按十进制处理
# NEW_NUM=$((10#$NUM_PART ))

# # 生成新的文件名，假设文件前缀是PRINTER
# OUTPUT_FILE="PRINTER${NEW_NUM}"

# # 编译 COBOL 程序
# cobc -x "${PROGRAM_NAME}.cob"

# # 检查编译是否成功
# if [ $? -eq 0 ]; then
#     # 运行编译后的程序
#     ./"$PROGRAM_NAME"
#     # 检查输出文件是否存在
#     if [ -f "$OUTPUT_FILE" ]; then
#         # 使用 cat 命令显示文件内容
#         cat "$OUTPUT_FILE"
#     else
#         echo "$OUTPUT_FILE file does not exist."
#     fi
# else
#     echo "Compilation failed."
#     exit 1
# fi