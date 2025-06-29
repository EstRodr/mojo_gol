# Mojo Game of Life

Welcome to the documentation for Conway's Game of Life implemented in Mojo! This project showcases the power and performance of the Mojo programming language through a classic cellular automaton simulation.

![Game of Life Demo](https://upload.wikimedia.org/wikipedia/commons/e/e5/Gospers_glider_gun.gif)

## Features

- 🚀 **High Performance**: Leveraging Mojo's speed for fast simulations
- 🎨 **Interactive Visualization**: Real-time rendering with Pygame
- ⚡ **Optimized**: Efficient grid operations and memory management
- 🎮 **Interactive Controls**: Pause, step, and control simulation speed
- 🎨 **Customizable**: Adjust colors, grid size, and simulation speed

## Quick Start

1. Install the prerequisites:
   ```bash
   # Install Mojo SDK
   # Install Python dependencies
   pip install pygame
   ```

2. Run the simulation:
   ```bash
   # Run directly with the Mojo interpreter
   mojo life/life.mojo
   
   # Or build an executable (optional)
   mojo build life/life.mojo -o life/game_of_life
   ./life/game_of_life
   ```

## Documentation

- [Getting Started](getting-started/installation.md) - Installation and setup instructions
- [User Guide](guide/usage.md) - How to use the simulation
- [API Reference](api/life.md) - Detailed API documentation
- [Development](development/building.md) - Building and contributing to the project

## Examples

```mojo
# Create a random 30x40 grid
let grid = Grid.random(30, 40)

# Run the simulation with visualization
run_display(grid, window_height=800, window_width=1000)
```

## Requirements

- Mojo SDK
- Python 3.8+
- Pygame

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/yourusername/mojo-game-of-life/blob/main/LICENSE) file for details.
