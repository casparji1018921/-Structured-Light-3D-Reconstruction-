import numpy as np
import matplotlib.pyplot as plt


# 生成投影条纹
# Create projection stripes
def generate_stripes(width, height, num_stripes):
    stripe_width = width // num_stripes
    img = np.zeros((height, width))

    for i in range(num_stripes):
        if i % 2 == 0:
            img[:, i * stripe_width:(i + 1) * stripe_width] = 255

    return img


width = 800
height = 600
num_stripes = 20

stripes_img = generate_stripes(width, height, num_stripes)

plt.imshow(stripes_img, cmap='gray')
plt.title("投影条纹 / Projection Stripes")
plt.show()

## 三维重建（当前有Bug，暂不可用）
## 3D Reconstruction (Currently buggy, not usable)

## def reconstruct_3D():
##     # 这里添加三维重建的代码
##     # Add 3D reconstruction code here
##     pass

## 注意：三维重建部分目前有Bug，暂时不能使用。我们正在努力解决这个问题。
## Note: The 3D reconstruction part is currently buggy and not usable. We are working hard to fix this issue.
