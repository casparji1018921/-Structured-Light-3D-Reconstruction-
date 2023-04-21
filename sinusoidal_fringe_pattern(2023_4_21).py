import numpy as np
import matplotlib.pyplot as plt

# Generate sinusoidal fringe pattern
width = 256
height = 256
fringe_period = 20

x = np.linspace(0, width, width)
y = np.linspace(0, height, height)
X, Y = np.meshgrid(x, y)

fringe_pattern = 0.5 + 0.5 * np.cos(2 * np.pi * X / fringe_period)

# Plot the fringe pattern
plt.imshow(fringe_pattern, cmap='gray')
plt.title("Sinusoidal Fringe Pattern")
plt.show()

# Add your code for capturing the deformed pattern and reconstructing the 3D shape here
