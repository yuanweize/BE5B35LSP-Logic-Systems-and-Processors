#!/usr/bin/env python3
"""
Markdown to PDF Converter for Chinese Documents
Supports Chinese characters with proper font rendering
"""

import markdown
from weasyprint import HTML, CSS
import sys
from pathlib import Path

# CSS for clean, readable PDF with Chinese font support
CSS_STYLE = """
@page {
    size: A4;
    margin: 2.5cm 2cm;
    @bottom-center {
        content: counter(page);
        font-size: 10pt;
        color: #666;
    }
}

body {
    font-family: "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "STHeiti", sans-serif;
    font-size: 11pt;
    line-height: 1.8;
    color: #333;
}

h1 {
    font-size: 22pt;
    color: #1a5276;
    border-bottom: 3px solid #3498db;
    padding-bottom: 10px;
    margin-top: 30px;
    page-break-after: avoid;
}

h2 {
    font-size: 16pt;
    color: #2874a6;
    border-bottom: 1px solid #aed6f1;
    padding-bottom: 6px;
    margin-top: 25px;
    page-break-after: avoid;
}

h3 {
    font-size: 13pt;
    color: #34495e;
    margin-top: 20px;
    page-break-after: avoid;
}

h4 {
    font-size: 12pt;
    color: #5d6d7e;
    margin-top: 15px;
}

p {
    text-align: justify;
    margin: 10px 0;
}

table {
    border-collapse: collapse;
    width: 100%;
    margin: 15px 0;
    font-size: 10pt;
}

th, td {
    border: 1px solid #bdc3c7;
    padding: 8px 12px;
    text-align: left;
}

th {
    background-color: #3498db;
    color: white;
    font-weight: bold;
}

tr:nth-child(even) {
    background-color: #f8f9fa;
}

tr:hover {
    background-color: #ebf5fb;
}

code {
    font-family: "SF Mono", "Monaco", "Menlo", monospace;
    background-color: #f4f6f7;
    padding: 2px 6px;
    border-radius: 3px;
    font-size: 9pt;
    color: #c0392b;
}

pre {
    background-color: #2c3e50;
    color: #ecf0f1;
    padding: 15px;
    border-radius: 5px;
    overflow-x: auto;
    font-size: 9pt;
    line-height: 1.5;
    page-break-inside: avoid;
}

pre code {
    background-color: transparent;
    color: inherit;
    padding: 0;
}

blockquote {
    border-left: 4px solid #3498db;
    margin: 15px 0;
    padding: 10px 20px;
    background-color: #ebf5fb;
    font-style: italic;
    color: #2c3e50;
}

ul, ol {
    margin: 10px 0;
    padding-left: 25px;
}

li {
    margin: 5px 0;
}

hr {
    border: none;
    border-top: 2px solid #3498db;
    margin: 25px 0;
}

a {
    color: #2980b9;
    text-decoration: none;
}

/* Emoji support */
.emoji {
    font-family: "Apple Color Emoji", "Segoe UI Emoji", sans-serif;
}

/* Cover page styling */
.cover-title {
    font-size: 28pt;
    text-align: center;
    margin-top: 200px;
}

/* Checkbox styling */
input[type="checkbox"] {
    margin-right: 8px;
}

/* Details/Summary for collapsible sections */
details {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
    margin: 10px 0;
}

summary {
    font-weight: bold;
    cursor: pointer;
    color: #2874a6;
}
"""

def convert_md_to_pdf(md_path: str, pdf_path: str = None) -> str:
    """Convert Markdown file to PDF with Chinese support"""
    
    md_file = Path(md_path)
    if not md_file.exists():
        raise FileNotFoundError(f"Markdown file not found: {md_path}")
    
    # Default output path
    if pdf_path is None:
        pdf_path = md_file.with_suffix('.pdf')
    
    # Read Markdown content
    with open(md_file, 'r', encoding='utf-8') as f:
        md_content = f.read()
    
    # Convert Markdown to HTML
    md_converter = markdown.Markdown(
        extensions=[
            'tables',
            'fenced_code',
            'toc',
            'nl2br',
            'sane_lists'
        ]
    )
    html_body = md_converter.convert(md_content)
    
    # Wrap in full HTML document
    html_doc = f"""
    <!DOCTYPE html>
    <html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <title>{md_file.stem}</title>
    </head>
    <body>
    {html_body}
    </body>
    </html>
    """
    
    # Convert to PDF
    HTML(string=html_doc).write_pdf(
        pdf_path,
        stylesheets=[CSS(string=CSS_STYLE)]
    )
    
    return str(pdf_path)


def main():
    """Main entry point for command-line usage"""
    
    # Define files to convert
    base_path = Path(__file__).parent.parent / "book1_酒店汉语"
    
    files_to_convert = [
        (base_path / "docs" / "EDITING_GUIDE.md", base_path / "docs" / "编辑指南_EDITING_GUIDE.pdf"),
        (base_path / "docs" / "DATA_CHECKLIST.md", base_path / "docs" / "数据清单_DATA_CHECKLIST.pdf"),
        (base_path.parent / "README.md", base_path / "docs" / "项目说明_README.pdf"),
    ]
    
    print("=" * 60)
    print("📄 Markdown → PDF Converter (Chinese Support)")
    print("=" * 60)
    
    success_count = 0
    for md_path, pdf_path in files_to_convert:
        try:
            print(f"\n📝 Converting: {md_path.name}")
            result = convert_md_to_pdf(str(md_path), str(pdf_path))
            print(f"   ✅ Output: {Path(result).name}")
            success_count += 1
        except Exception as e:
            print(f"   ❌ Error: {e}")
    
    print("\n" + "=" * 60)
    print(f"✅ Completed: {success_count}/{len(files_to_convert)} files converted")
    print("=" * 60)
    
    return 0 if success_count == len(files_to_convert) else 1


if __name__ == "__main__":
    sys.exit(main())
