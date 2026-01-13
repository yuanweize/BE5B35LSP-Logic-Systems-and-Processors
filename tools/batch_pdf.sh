#!/bin/bash
# ================================================================
# 海南俄语旅游研究项目 - PDF 交付包生成脚本
# 使用 pandoc 将 Markdown 转换为 PDF
# ================================================================

set -e  # Exit on error

# 基础路径
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOCS_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$DOCS_DIR/output"

echo "================================================================"
echo "📄 海南俄语旅游研究项目 - PDF 交付包生成"
echo "================================================================"
echo "📁 输出目录: $OUTPUT_DIR"
echo "----------------------------------------------------------------"

# 确保输出目录存在
mkdir -p "$OUTPUT_DIR"

# 转换函数
convert_file() {
    local input="$1"
    local output="$2"
    local name=$(basename "$input")
    
    echo ""
    echo "📝 正在转换: $name"
    
    if [ ! -f "$input" ]; then
        echo "   ❌ 文件未找到: $input"
        return 1
    fi
    
    # 使用 pandoc 转换
    pandoc "$input" \
        --pdf-engine=xelatex \
        -V CJKmainfont="Songti SC" \
        -V mainfont="Songti SC" \
        -V monofont="Menlo" \
        -V geometry:margin=2.5cm \
        -V fontsize=11pt \
        -V colorlinks=true \
        -V urlcolor=blue \
        --highlight-style=tango \
        -o "$output" 2>&1 | grep -v "WARNING" || true
    
    if [ -f "$output" ]; then
        echo "   ✅ 生成: $(basename "$output")"
        return 0
    else
        echo "   ❌ 转换失败"
        return 1
    fi
}

# ================================================================
# 开始转换
# ================================================================

# 1. 项目总索引
convert_file "$DOCS_DIR/INDEX.md" "$OUTPUT_DIR/01_项目总索引_INDEX.pdf"

# 2. 管理文档
convert_file "$DOCS_DIR/Full_audit_report_Final.md" "$OUTPUT_DIR/02_审计报告_Full_audit_report.pdf"
convert_file "$DOCS_DIR/EDITING_GUIDE.md" "$OUTPUT_DIR/03_编辑指南_EDITING_GUIDE.pdf"
convert_file "$DOCS_DIR/DATA_CHECKLIST.md" "$OUTPUT_DIR/04_数据清单_DATA_CHECKLIST.pdf"

# 3. 核心交付件
convert_file "$DOCS_DIR/演讲稿_海南俄语旅游研究.md" "$OUTPUT_DIR/05_演讲稿_海南俄语旅游研究.pdf"

# 4. PPT 指令集
convert_file "$DOCS_DIR/PPT_Prompts/Module_1_开场与客源画像.md" "$OUTPUT_DIR/06_PPT_Module1_开场与客源画像.pdf"
convert_file "$DOCS_DIR/PPT_Prompts/Module_2_环境与政策.md" "$OUTPUT_DIR/07_PPT_Module2_环境与政策.pdf"
convert_file "$DOCS_DIR/PPT_Prompts/Module_3_产品适配性.md" "$OUTPUT_DIR/08_PPT_Module3_产品适配性.pdf"
convert_file "$DOCS_DIR/PPT_Prompts/Module_4_人才与结论.md" "$OUTPUT_DIR/09_PPT_Module4_人才与结论.pdf"

# ================================================================
# 结果汇总
# ================================================================

echo ""
echo "================================================================"
PDF_COUNT=$(ls -1 "$OUTPUT_DIR"/*.pdf 2>/dev/null | wc -l | tr -d ' ')
echo "📊 转换结果: $PDF_COUNT/9 文件成功"
echo "================================================================"

# 显示生成的文件
echo ""
echo "📁 生成的 PDF 文件:"
ls -lh "$OUTPUT_DIR"/*.pdf 2>/dev/null || echo "   (无文件生成)"

exit 0
