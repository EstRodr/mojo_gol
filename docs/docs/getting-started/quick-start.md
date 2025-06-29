# Quick Start

This guide will help you quickly get started with the Mojo Game of Life simulation.

## Running the Simulation

### Basic Usage

To run the simulation with default settings (30x30 grid):

```bash
mojo life/life.mojo
```

### Custom Grid Size

To run with a custom grid size:

```bash
mojo life/life.mojo --rows 50 --cols 50
```

### Custom Frame Rate

To adjust the simulation speed (frames per second):

```bash
mojo life/life.mojo --fps 20
```

### Building an Executable (Optional)

If you want to create an executable for faster startup:

```bash
# Build the executable
mojo build life/life.mojo -o life/game_of_life

# Run the executable
./life/game_of_life
```

## Interactive Controls

Once the simulation is running, use these keyboard controls:

- `Space`: Pause/Resume the simulation
- `Right Arrow`: Single step (when paused)
- `R`: Reset the simulation with a new random pattern
- `+`: Increase simulation speed
- `-`: Decrease simulation speed
- `Q` or `ESC`: Quit the application

## Example Patterns

### Create a Glider Pattern

```mojo
fn create_glider(grid: Grid) -> None:
    """Initialize the grid with a glider pattern."""
    # Center the glider
    center_row = grid.rows // 2
    center_col = grid.cols // 2
    
    # Glider pattern
    grid[center_row, center_col + 1] = 1
    grid[center_row + 1, center_col + 2] = 1
    grid[center_row + 2, center_col] = 1
    grid[center_row + 2, center_col + 1] = 1
    grid[center_row + 2, center_col + 2] = 1
```

### Run with a Custom Pattern

```mojo
def main():
    # Create a 40x40 grid
    let rows = 40
    let cols = 40
    var grid = Grid(rows, cols)
    
    # Add a glider
    create_glider(grid)
    
    # Run the simulation
    run_display(
        grid,
        window_height=800,
        window_width=800,
        cell_color="#00FF00",
        background_color="#000000"
    )
```

## Command Line Options

```
Usage: ./life/game_of_life [options]

Options:
  --rows ROWS         Number of rows in the grid (default: 30)
  --cols COLS         Number of columns in the grid (default: 30)
  --fps FPS           Frames per second (default: 10)
  --cell-size PIXELS  Size of each cell in pixels (default: 20)
  --alive-color COLOR Color of live cells (hex code, default: #4285F4)
  --dead-color COLOR  Color of dead cells (hex code, default: #202124)
  --help              Show this help message
```

## Next Steps

- Learn more about [Game of Life patterns](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Examples_of_patterns)
- Explore the [API Reference](../api/life.md) for advanced usage
- Check out the [User Guide](../guide/usage.md) for more detailed information
