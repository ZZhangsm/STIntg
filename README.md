<!-- # STUltra -->

<div align="center">


# **STUltra: Mapping disease traits onto  spatiotemporal domain landscapes through scalable multi-sample integration of spatial transcriptomics**

[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![GitHub](https://img.shields.io/badge/GitHub-Repository-black.svg)](https://github.com/ZZhangsm/STUltra)
<!-- [![Downloads](https://img.shields.io/badge/Downloads-pypi-orange.svg)](https://pypi.org/project/STUltra/) -->
<!-- [![DOI](https://img.shields.io/badge/DOI-Coming%20Soon-yellow.svg)](https://github.com/ZZhangsm/STUltra) -->

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Installation](#-installation)
  - [Prerequisites](#prerequisites)
  - [Step-by-step Installation](#step-by-step-installation)
- [Tutorials](#-tutorials)
- [Support](#-support)

---

## 🎯 Overview

![STUltra_Overview](https://github.com/ZZhangsm/STUltra/blob/main/overview.jpg)

Subcellular-level spatial transcriptomics data contain unprecedented contexts to uncover finer cellular clusters and their interactions. However, integrative analysis at subcellular resolution faces many challenges due to its ultra-large volume, ultra-high sparsity, and severe susceptibility to technical conditions and batch effects.

We introduce **STUltra**, a scalable hypergraph framework that integrates multi-sample ST data for precise domain detection and genome-wide association study (GWAS)-based disease trait mapping. From ST datasets, STUltra first constructs interval-sampled integrative hypergraphs, in which hyperedges capture tissue neighborhoods within the slices as well as shared biological contexts across the slices. It then combines a robust graph autoencoder with contrastive learning to learn batch-corrected, spatially informed embeddings for identifying spatial domains across the tissue sections. These embeddings are then coupled with GWAS statistics to map trait-associated signals onto the integrated tissue sub-structure landscapes spanning different sections, developmental stages, and disease conditions. 

### ✨ Key Features

- 🔬 **Subcellular Resolution**: Designed for ultra-high-resolution spatial transcriptomics data with extreme sparsity
- 🚀 **Million-scale Scalability**: Efficiently processes datasets containing over **1,000,000** spatial locations
- 🎯 **Accurate Domain Detection**: Learns robust spatial representations and consistently outperforms existing integration methods
- 🔄 **Cross-platform Integration**: Supports Visium HD, Xenium, Stereo-seq, and other high-resolution spatial transcriptomics platforms
- 🧩 **Robust Batch Correction**: Integrates samples across spatial, temporal, and biological conditions while reducing batch effects
- 🌍 **Spatial Context Modeling**: Uses interval-sampled hypergraphs to capture both local tissue neighborhoods and cross-sample biological contexts
- 🧬 **Disease Trait Mapping**: Integrates GWAS summary statistics to identify trait-associated spatial domains across tissues
- 🚧 **Coming Soon**: GWAS mapping code is being organized and will be released soon.

> **📢 Note:** The GWAS trait mapping module is currently being cleaned up and documented. The corresponding code will be released in a later update.
---

## 💻 Installation

### Prerequisites

- Python 3.8+
- Conda (recommended)
- R (for mclust algorithm)

### Step-by-step Installation

#### 1. Clone the repository
First clone the repository. 

```
git clone https://github.com/ZZhangsm/STUltra.git
cd STUltra-main
```


#### 2. Create a conda environment


```
# create an environment called STUltra
conda create -n env_STUltra python=3.8

# activate your environment
conda activate env_STUltra
```



#### 3. Install required packages
Install all the required packages. 

For Linux
```
# Install Python packages

pip install -r requirements.txt
```
#### 4. Install additional dependencies

**mclust algorithm:**
- Python: Install `rpy2` package - see [rpy2 documentation](https://pypi.org/project/rpy2/)
- R: Install `mclust` package - see [mclust documentation](https://cran.r-project.org/web/packages/mclust/index.html)

**torch-geometric:**
- Follow the installation steps in [PyTorch Geometric documentation](https://github.com/pyg-team/pytorch_geometric#installation)

#### 5. Install STUltra

```
python setup.py build
python setup.py install
```
## 📚 Tutorials

Step-by-step tutorials are included in the `Tutorials` folder to demonstrate how to use STUltra:

- **Tutorial 1**: Integrating 8 mouse embryo slices sampled at the time stages of E9.5-E16.5 (Stereo-seq)
- **Tutorial 2**: Integrating two Xenium breast cancer samples.
- **Tutorial 3**: Integrating two Visium HD colorectal cancer samples from the 10x Genomics official dataset (total cell count > 1M)

---

## 💬 Support

If you have any questions, please feel free to contact us:

📧 **Email**: [sm.zhang@smail.nju.edu.cn](mailto:sm.zhang@smail.nju.edu.cn)

---

