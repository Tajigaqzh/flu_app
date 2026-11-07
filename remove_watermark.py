#!/usr/bin/env python3
"""去除图片水印的脚本"""

import os
import cv2
import numpy as np
from pathlib import Path


def remove_watermark(image_path, output_path):
    """
    去除图片右下角的水印

    Args:
        image_path: 输入图片路径
        output_path: 输出图片路径
    """
    img = cv2.imread(str(image_path))
    if img is None:
        print(f"无法读取图片: {image_path}")
        return False

    height, width = img.shape[:2]

    watermark_height = int(height * 0.08)
    watermark_width = int(width * 0.35)

    y_start = height - watermark_height
    x_start = width - watermark_width

    region = img[y_start:height, x_start:width].copy()

    inpaint_mask = np.zeros((watermark_height, watermark_width), dtype=np.uint8)
    gray = cv2.cvtColor(region, cv2.COLOR_BGR2GRAY)

    _, thresh = cv2.threshold(gray, 30, 255, cv2.THRESH_BINARY)

    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))
    thresh = cv2.dilate(thresh, kernel, iterations=2)

    inpaint_mask = thresh

    inpainted_region = cv2.inpaint(region, inpaint_mask, 7, cv2.INPAINT_NS)

    img[y_start:height, x_start:width] = inpainted_region

    cv2.imwrite(str(output_path), img, [cv2.IMWRITE_PNG_COMPRESSION, 9])
    print(f"已处理: {image_path.name} -> {output_path.name}")
    return True


def main():
    input_dir = Path("/Users/nwyzx/Desktop/project/flu_app/assets/images/png")
    output_dir = input_dir / "cleaned"

    output_dir.mkdir(exist_ok=True)

    png_files = list(input_dir.glob("*.png"))

    if not png_files:
        print("未找到PNG文件")
        return

    print(f"找到 {len(png_files)} 个PNG文件")

    success_count = 0
    for png_file in png_files:
        output_path = output_dir / png_file.name
        if remove_watermark(png_file, output_path):
            success_count += 1

    print(f"\n完成！成功处理 {success_count}/{len(png_files)} 个文件")
    print(f"处理后的文件保存在: {output_dir}")


if __name__ == "__main__":
    main()
