#!/usr/bin/env python3
"""
批量 Markdown 转 PDF 脚本
生成海南俄语旅游研究项目的交付件 PDF 包
"""

import sys
from pathlib import Path

# 添加工具目录到路径
sys.path.insert(0, str(Path(__file__).parent))

from md2pdf import convert_md_to_pdf

def main():
    """批量转换 MD 文件到 PDF"""
    
    # 基础路径
    docs_dir = Path(__file__).parent.parent
    output_dir = docs_dir / "output"
    
    # 确保输出目录存在
    output_dir.mkdir(exist_ok=True)
    
    # 待转换文件列表 (源文件路径, 输出文件名)
    files_to_convert = [
        # 项目总索引
        (docs_dir / "INDEX.md", "01_项目总索引_INDEX.pdf"),
        
        # 管理文档
        (docs_dir / "Full_audit_report_Final.md", "02_审计报告_Full_audit_report.pdf"),
        (docs_dir / "EDITING_GUIDE.md", "03_编辑指南_EDITING_GUIDE.pdf"),
        (docs_dir / "DATA_CHECKLIST.md", "04_数据清单_DATA_CHECKLIST.pdf"),
        
        # 核心交付件
        (docs_dir / "演讲稿_海南俄语旅游研究.md", "05_演讲稿_海南俄语旅游研究.pdf"),
        
        # PPT 指令集
        (docs_dir / "PPT_Prompts" / "Module_1_开场与客源画像.md", "06_PPT_Module1_开场与客源画像.pdf"),
        (docs_dir / "PPT_Prompts" / "Module_2_环境与政策.md", "07_PPT_Module2_环境与政策.pdf"),
        (docs_dir / "PPT_Prompts" / "Module_3_产品适配性.md", "08_PPT_Module3_产品适配性.pdf"),
        (docs_dir / "PPT_Prompts" / "Module_4_人才与结论.md", "09_PPT_Module4_人才与结论.pdf"),
    ]
    
    print("=" * 70)
    print("📄 海南俄语旅游研究项目 - PDF 交付包生成")
    print("=" * 70)
    print(f"📁 输出目录: {output_dir}")
    print("-" * 70)
    
    success_count = 0
    failed_files = []
    
    for md_path, pdf_name in files_to_convert:
        pdf_path = output_dir / pdf_name
        try:
            print(f"\n📝 正在转换: {md_path.name}")
            result = convert_md_to_pdf(str(md_path), str(pdf_path))
            print(f"   ✅ 生成: {pdf_name}")
            success_count += 1
        except FileNotFoundError as e:
            print(f"   ❌ 文件未找到: {e}")
            failed_files.append((md_path.name, str(e)))
        except Exception as e:
            print(f"   ❌ 转换失败: {e}")
            failed_files.append((md_path.name, str(e)))
    
    print("\n" + "=" * 70)
    print(f"📊 转换结果: {success_count}/{len(files_to_convert)} 文件成功")
    
    if failed_files:
        print("\n⚠️  失败文件:")
        for name, error in failed_files:
            print(f"   - {name}: {error}")
    
    print("=" * 70)
    
    return 0 if success_count == len(files_to_convert) else 1


if __name__ == "__main__":
    sys.exit(main())
