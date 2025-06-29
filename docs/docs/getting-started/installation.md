# Installation

This guide will help you install and set up the Mojo Game of Life project on your system.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Mojo SDK](https://docs.modular.com/mojo/)
- Python 3.8 or later
- [Git](https://git-scm.com/)
- [Pixi](https://pixi.sh/) (for development)

## Installing Mojo

1. Follow the official [Mojo installation guide](https://docs.modular.com/mojo/manual/get-started/) for your operating system.

2. Verify the installation:
   ```bash
   mojo --version
   ```

## Installing Python Dependencies

1. Install Pygame for visualization:
   ```bash
   pip install pygame
   ```

## Cloning the Repository

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/mojo-game-of-life.git
   cd mojo-game-of-life
   ```

## Running the Simulation

You can run the simulation in two ways:

### Option 1: Run directly with Mojo interpreter (Recommended for development)

```bash
# Run with default settings
mojo life/life.mojo

# Run with custom grid size
mojo life/life.mojo --rows 50 --cols 80

# Run with custom frame rate
mojo life/life.mojo --fps 15
```

### Option 2: Build and run as an executable (Optional)

If you want to create an executable for faster startup:

```bash
# Build the executable
mojo build life/life.mojo -o life/game_of_life

# Run the executable
./life/game_of_life --rows 50 --cols 80 --fps 15
```

## Development Setup

1. Install Pixi (recommended for development):
   ```bash
   curl -fsSL https://pixi.sh/install.sh | bash
   ```

2. Set up the development environment:
   ```bash
   cd life
   pixi install
   ```

## Verifying the Installation

1. Run the tests to verify everything is working:
   ```bash
   mojo test life/tests/
   ```

## Troubleshooting

### Common Issues

1. **Mojo not found**
   - Ensure the Mojo SDK is properly installed and added to your PATH
   - Run `source ~/.modular/etc/mojo.rc` (or the appropriate file for your shell)

2. **Pygame installation fails**
   - Ensure you have Python development headers installed
   - On Ubuntu/Debian: `sudo apt-get install python3-dev python3-pygame`
   - On macOS: `brew install sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf`

3. **Build errors**
   - Ensure all dependencies are installed
   - Check that your Mojo version is compatible with the project

## Next Steps

- [Quick Start Guide](../getting-started/quick-start.md)
- [User Guide](../guide/usage.md)
