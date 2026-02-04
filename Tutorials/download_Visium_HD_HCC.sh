#!/bin/bash

# Download all files
echo "Starting file download..."

# 批量下载P1和P2样本文件
for sample in P1 P2; do
  base_url="https://cf.10xgenomics.com/samples/spatial-exp/3.0.0/Visium_HD_Human_Colon_Cancer_${sample}/Visium_HD_Human_Colon_Cancer_${sample}"
#   for file in binned_outputs.tar.gz spatial.tar.gz molecule_info.h5 cloupe_008um.cloupe feature_slice.h5 metrics_summary.csv; do
    for file in binned_outputs.tar.gz spatial.tar.gz feature_slice.h5 metrics_summary.csv; do
    aria2c -x 4 -s 4 "${base_url}_${file}"
  done
done

# Organize P1 files
echo "Organizing P1 files..."
tar -zxf Visium_HD_Human_Colon_Cancer_P1_binned_outputs.tar.gz
tar -zxf Visium_HD_Human_Colon_Cancer_P1_spatial.tar.gz
mkdir -p Human_Colon_Cancer_P1
mv binned_outputs/ Human_Colon_Cancer_P1 
mv spatial/ Human_Colon_Cancer_P1/

# # Organize P2 files
echo "Organizing P2 files..."
mkdir -p Human_Colon_Cancer_P2
tar -zxf Visium_HD_Human_Colon_Cancer_P2_binned_outputs.tar.gz
tar -zxf Visium_HD_Human_Colon_Cancer_P2_spatial.tar.gz
mv binned_outputs/ Human_Colon_Cancer_P2 
mv spatial/ Human_Colon_Cancer_P2/

echo "All files have been downloaded and organized!"

# 重命名并移动 P2 feature_slice 文件
mv Visium_HD_Human_Colon_Cancer_P2_feature_slice.h5 \
   Human_Colon_Cancer_P2/P2_feature_slice.h5

# 重命名并移动 P2 metrics_summary 文件
mv Visium_HD_Human_Colon_Cancer_P2_metrics_summary.csv \
   Human_Colon_Cancer_P2/metrics_summary.csv

mv Visium_HD_Human_Colon_Cancer_P1_feature_slice.h5 \
   Human_Colon_Cancer_P1/P1_feature_slice.h5

# 重命名并移动 P2 metrics_summary 文件
mv Visium_HD_Human_Colon_Cancer_P1_metrics_summary.csv \
   Human_Colon_Cancer_P1/metrics_summary.csv


# Show directory structure
echo -e "\nFinal directory structure:"
tree Human_Colon_Cancer_P1 Human_Colon_Cancer_P2 -L 2

# 将 tissue_positions.parquet 转为 tissue_positions_list.csv 供 read_visium 使用
echo -e "\nConverting tissue_positions.parquet to tissue_positions_list.csv where needed..."
for sample in P1 P2; do
  for bin_dir in square_002um square_008um square_016um; do
    spatial_dir="Human_Colon_Cancer_${sample}/binned_outputs/${bin_dir}/spatial"
    parquet_file="${spatial_dir}/tissue_positions.parquet"
    csv_file="${spatial_dir}/tissue_positions_list.csv"
    if [[ -d "$spatial_dir" ]] && [[ -f "$parquet_file" ]]; then
      if [[ ! -f "$csv_file" ]]; then
        echo "  Converting: ${parquet_file} -> tissue_positions_list.csv"
        python3 -c "
import pandas as pd
position_df = pd.read_parquet('${parquet_file}')
position_df.to_csv('${csv_file}', index=False, header=None)
"
      else
        echo "  Already exists: ${csv_file}"
      fi
    fi
  done
done
echo "tissue_positions_list.csv conversion done."
