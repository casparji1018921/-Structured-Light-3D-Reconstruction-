# Structured-Light-3D-Reconstruction

This repository contains personal learning materials and code related to structured light 3D reconstruction, based on the paper [A Versatile Method for 3D Shape Reconstruction Using a Multi-Frequency Phase Measuring Profilometry](https://ieeexplore.ieee.org/document/9066902). The purpose is to share and communicate, to assist those interested in this topic. Feel free to contact me for any feedback or suggestions.

## Overview

The paper introduces a versatile method for 3D shape reconstruction using Multi-Frequency Phase Measuring Profilometry (PMP). This method mainly projects a series of sinusoidal fringe patterns (also called structured light patterns) onto the object's surface using a projector, captures the object's surface shape using a camera, and then recovers the object's 3D shape by calculating the phase value of each pixel.

## Core Concepts

1. **Sinusoidal Fringe Projection**: The projector projects sinusoidally distributed intensity fringes onto the object's surface. The number and period of the fringes can be adjusted to accommodate different objects and measurement requirements.

2. **Phase Measurement**: The camera captures the sinusoidal fringes projected onto the object. By calculating the phase value of each pixel (using a 3-step phase-shifting algorithm), the relative position of the object's surface can be determined.

3. **Phase Unwrapping**: Since the phase values range from 0 to 2π, phase unwrapping is required to obtain continuous phase values. This can be achieved by performing phase unwrapping along the row and column directions, respectively.

4. **3D Shape Reconstruction**: The 3D shape of the object is calculated based on the unwrapped phase map. By combining the unwrapped phase map with the fringe period, the height information of the object's surface can be calculated.

In addition to the traditional structured light methods, the paper also discusses the integration of deep learning techniques to improve the accuracy and robustness of the 3D reconstruction.

This code repository includes Python code for generating simulated fringe projection patterns, calculating phase maps, and recovering the 3D shape of the object. It is hoped that this code repository will help those who are learning about structured light 3D reconstruction.

If you have any questions or suggestions, please feel free to contact me.
# 结构光三维重建

本代码库存放了个人学习结构光三维重建的学习内容和代码，基于论文 [A Versatile Method for 3D Shape Reconstruction Using a Multi-Frequency Phase Measuring Profilometry](https://ieeexplore.ieee.org/document/9066902)。旨在分享和交流，帮助其他对该主题感兴趣的人。如有问题或建议，欢迎联系我！

## 概述

论文提出了一种基于多频相位测量轮廓术（PMP）的三维形状重建的通用方法。该方法主要是使用投影仪将一系列正弦分布的条纹图案（也称为结构光图案）投射到物体表面，使用相机捕捉物体表面形状，然后通过计算每个像素的相位值来恢复物体的三维形状。

## 核心概念

1. **正弦条纹投影**：投影仪将正弦分布的光强条纹投射到物体表面。条纹的数量和周期可以根据不同的物体和测量要求进行调整。

2. **相位测量**：相机捕捉到投射到物体上的正弦条纹。通过计算每个像素的相位值（使用三步相移算法），可以确定物体表面的相对位置。

3. **相位解包**：由于相位值的范围为0到2π，因此需要解包相位以获得连续的相位值。这可以通过分别沿行和列方向进行相位解包来实现。

4. **三维形状重建**：根据解包后的相位图计算物体的三维形状。通过将解包后的相位图与条纹周期结合，可以计算物体表面的高度信息。

除了传统的结构光方法外，论文还讨论了将深度学习技术与三维重建相结合以提高准确性和稳健性。

本代码库包括用于生成模拟条纹投影图案、计算相位图和恢复物体三维形状的Python代码。希望这个代码库能帮助那些正在学习结构光三维重建的人。

如有任何问题或建议，请随时联系我。
