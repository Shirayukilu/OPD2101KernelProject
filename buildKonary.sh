#!/bin/bash
clear

PROJECT_DIR=$(pwd)
KERNEL_SRC="${PROJECT_DIR}/KernelSource/opd2101_offical"
TOOLCHAIN_DIR="${PROJECT_DIR}/toolchain"
OUT_DIR="${PROJECT_DIR}/build-official-out"

export ARCH=arm64
export LLVM=1
export CLANG_TRIPLE=aarch64-linux-gnu-
export PATH="${TOOLCHAIN_DIR}/clang-r547379/bin:${PATH}"
export CROSS_COMPILE="${TOOLCHAIN_DIR}/GCC/aarch64-linux-gnu-"

rm -rf "${OUT_DIR}"
mkdir -p "${OUT_DIR}"

cd "${KERNEL_SRC}"

# ========== 关键修改：在 make 命令前加上 PYTHON=python2 ==========
PYTHON=python2 make O="${OUT_DIR}" defconfig
PYTHON=python2 make O="${OUT_DIR}" -j$(nproc)

echo ""
echo "====================================="
echo "✅ 官方内核编译完成"
echo "镜像输出：${OUT_DIR}/arch/arm64/boot/"
echo "====================================="

