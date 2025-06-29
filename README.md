# Conway's Game of Life in Mojo

A high-performance implementation of Conway's Game of Life using the Mojo programming language, featuring interactive visualization with Pygame.

![Game of Life Demo](https://upload.wikimedia.org/wikipedia/commons/e/e5/Gospers_glider_gun.gif)

## Features

- 🚀 High-performance simulation using Mojo
- 🎨 Interactive visualization with Pygame
- ⚡ Optimized grid operations
- 🎮 Interactive controls (pause, step, reset)
- 🎨 Customizable colors and display options

## Prerequisites

- [Mojo SDK](https://docs.modular.com/mojo/) installed
- Python 3.8+ with Pygame installed
  ```bash
  pip install pygame
  ```

## Installation

1. Make sure you have the [Mojo SDK](https://developer.modular.com/get-started) installed.

## Usage

### Running the Simulation

To run the Game of Life simulation, use the Mojo interpreter:

```bash
# Run the simulation with default settings
mojo life/life.mojo
```

### Command Line Arguments

You can customize the simulation with these arguments:

```bash
# Run with custom grid size
mojo life/life.mojo --rows 40 --cols 80

# Run with a specific frame rate
mojo life/life.mojo --fps 10
```

### Interactive Controls

- `Space`: Pause/Resume simulation
- `Right Arrow`: Single step when paused
- `R`: Reset simulation
- `Q` or `ESC`: Quit
- `+`/`-`: Increase/Decrease simulation speed

### Building an Executable

If you want to build an executable, you can use the Mojo compiler:

```bash
mojo build life/life.mojo -o life/game_of_life
```

Then run it with:
```bash
./life/game_of_life
```

Note: The build step is optional - you can run the script directly with the Mojo interpreter.

## Configuration

You can customize the simulation by modifying the following parameters in `life/config.mojo`:

```mojo
let ROWS = 30          # Number of rows in the grid
let COLS = 50          # Number of columns in the grid
let FPS = 10           # Frames per second
let CELL_SIZE = 20     # Size of each cell in pixels
let ALIVE_COLOR = "#4285F4"  # Color of live cells
let DEAD_COLOR = "#202124"   # Color of dead cells
```

## Project Structure

```
mojo-game-of-life/
├── life/
│   ├── life.mojo      # Main simulation and visualization
│   ├── gridv1.mojo     # Grid implementation
│   ├── pixi.toml       # Pixi environment configuration
│   └── pixi.lock       # Pixi lock file
├── docs/               # Documentation
├── tests/              # Test files
└── README.md           # This file
```

## Development

### Setting Up Development Environment

1. Install Pixi (if not already installed):
   ```bash
   curl -fsSL https://pixi.sh/install.sh | bash
   ```

2. Install development dependencies:
   ```bash
   cd life
   pixi install
   ```

### Running Tests

```bash
mojo test life/tests/
```

## Performance

The implementation is optimized for performance using Mojo's features:
- SIMD operations for grid updates
- Efficient memory management
- Parallel computation where applicable

## Contributing

Contributions are welcome! Please read our [Contributing Guidelines](CONTRIBUTING.md) for details on how to submit pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)
- [Mojo Programming Language](https://docs.modular.com/mojo/)
- [Pygame](https://www.pygame.org/)

---

Made with ❤️ and Mojo
