# Configuration Guide

This guide explains how to configure various aspects of the Mojo Game of Life simulation, including display settings, simulation parameters, and customization options.

## Table of Contents

- [Configuration Options](#configuration-options)
- [Command Line Arguments](#command-line-arguments)
- [Configuration File](#configuration-file)
- [Environment Variables](#environment-variables)
- [Runtime Configuration](#runtime-configuration)
- [Custom Themes](#custom-themes)
- [Performance Tuning](#performance-tuning)

## Configuration Options

### Display Settings

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `window_width` | Integer | 800 | Width of the display window in pixels |
| `window_height` | Integer | 600 | Height of the display window in pixels |
| `cell_size` | Integer | 20 | Size of each cell in pixels |
| `cell_color` | String | "#4285F4" | Color of live cells (hex code) |
| `background_color` | String | "#202124" | Color of dead cells (hex code) |
| `grid_color` | String | "#3C4043" | Color of grid lines (or None to disable) |
| `fps` | Integer | 10 | Target frames per second |

### Simulation Settings

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `rows` | Integer | 30 | Number of rows in the grid |
| `cols` | Integer | 30 | Number of columns in the grid |
| `wrap_edges` | Boolean | True | Whether the grid wraps around at edges |
| `initial_pattern` | String | "random" | Initial pattern ("random", "glider", "blinker", etc.) |
| `random_seed` | Integer | None | Seed for random number generation |

## Command Line Arguments

You can configure the simulation using command line arguments with the Mojo interpreter:

```bash
# Run with custom settings
mojo life/life.mojo \
    --rows 40 \
    --cols 60 \
    --fps 15 \
    --cell-size 15 \
    --alive-color "#FF0000" \
    --dead-color "#000000" \
    --grid-color "#666666" \
    --pattern glider

# Or build and run as an executable (optional)
mojo build life/life.mojo -o life/game_of_life
./life/game_of_life --rows 40 --cols 60 --fps 15
```

### Full List of Command Line Options

```
--rows ROWS         Number of rows in the grid (default: 30)
--cols COLS         Number of columns in the grid (default: 30)
--fps FPS           Target frames per second (default: 10)
--cell-size PIXELS  Size of each cell in pixels (default: 20)
--alive-color COLOR Color of live cells (hex code, default: #4285F4)
--dead-color COLOR  Color of dead cells (hex code, default: #202124)
--grid-color COLOR  Color of grid lines (hex code or 'none', default: #3C4043)
--pattern PATTERN   Initial pattern (random, glider, blinker, etc.)
--wrap-edges        Wrap grid edges (default: True)
--no-wrap-edges     Don't wrap grid edges
--seed SEED         Random seed for reproducible patterns
--config FILE       Load configuration from file
--save-config FILE   Save current configuration to file
--version           Show version and exit
--help              Show help message and exit
```

## Configuration File

For more complex configurations, you can use a TOML configuration file:

```toml
# config.toml
[display]
width = 1000
height = 800
cell_size = 15
fps = 20

[colors]
alive = "#FF5722"  # Deep Orange
background = "#212121"
grid = "#424242"

[simulation]
rows = 50
cols = 80
wrap_edges = true
initial_pattern = "glider_guns"
random_seed = 42
```

Load the configuration file:

```bash
mojo life/life.mojo --config config.toml

# Or with the built executable
./life/game_of_life --config config.toml
```

## Environment Variables

You can also configure the simulation using environment variables:

```bash
export GOL_ROWS=40
export GOL_COLS=60
export GOL_FPS=15
export GOL_CELL_SIZE=20
export GOL_ALIVE_COLOR="#FF0000"
./life/game_of_life
```

### Available Environment Variables

- `GOL_ROWS`: Number of rows
- `GOL_COLS`: Number of columns
- `GOL_FPS`: Frames per second
- `GOL_CELL_SIZE`: Cell size in pixels
- `GOL_ALIVE_COLOR`: Color of live cells
- `GOL_DEAD_COLOR`: Color of dead cells
- `GOL_GRID_COLOR`: Color of grid lines (or 'none')
- `GOL_PATTERN`: Initial pattern
- `GOL_WRAP_EDGES`: 'true' or 'false'
- `GOL_SEED`: Random seed

## Runtime Configuration

You can modify some settings at runtime using the GUI:

1. Press `P` to pause the simulation
2. Press `C` to show the configuration menu
3. Adjust settings using the arrow keys and Enter
4. Press `ESC` to return to the simulation

## Custom Themes

Create a custom theme by defining color schemes:

```python
# In your initialization code
themes = {
    "classic": {
        "alive": "#FFFFFF",
        "dead": "#000000",
        "grid": "#333333"
    },
    "matrix": {
        "alive": "#00FF00",
        "dead": "#001F00",
        "grid": "#003300"
    },
    "sunset": {
        "alive": "#FF5722",
        "dead": "#311B92",
        "grid": "#5E35B1"
    }
}

# Apply a theme
def apply_theme(theme_name):
    theme = themes.get(theme_name, themes["classic"])
    config.cell_color = theme["alive"]
    config.background_color = theme["dead"]
    config.grid_color = theme["grid"]
```

## Performance Tuning

### For Large Grids

For better performance with large grids:

1. Reduce the frame rate:
   ```bash
   mojo life/life.mojo --rows 100 --cols 150 --fps 5
   ```

2. Disable grid lines:
   ```bash
   mojo life/life.mojo --grid-color none
   ```

3. Use simpler patterns or reduce randomization

### Memory Usage

Memory usage is approximately:
```
memory_bytes = rows * cols * 8  # 8 bytes per cell (64-bit integers)
```

For a 1000x1000 grid, this is about 8MB of memory.

### Profiling

To profile the simulation:

```bash
# On macOS
/usr/bin/time -l mojo life/life.mojo --rows 100 --cols 100

# With Python's cProfile
python -m cProfile -o profile.prof -m mojo mojo life/life.mojo
```

## Advanced Configuration

### Custom Rules

You can implement custom Game of Life rules by modifying the `evolve` method in the `Grid` class:

```mojo
def custom_evolve(self) -> Grid:
    """Custom evolution rules."""
    let new_grid = Grid(self.rows, self.cols)
    
    for i in range(self.rows):
        for j in range(self.cols):
            neighbors = self.count_live_neighbors(i, j)
            
            # Custom rule: HighLife's B36/S23
            if self[i, j] == 1:  # Cell is alive
                if neighbors == 2 or neighbors == 3:
                    new_grid[i, j] = 1  # Survival
                else:
                    new_grid[i, j] = 0  # Death
            else:  # Cell is dead
                if neighbors == 3 or neighbors == 6:
                    new_grid[i, j] = 1  # Birth
                else:
                    new_grid[i, j] = 0  # Stay dead
    
    return new_grid
```

### Custom Patterns

Add custom patterns by creating pattern files in the `patterns` directory:

1. Create a `.cells` file (e.g., `glider_gun.cells`)
2. Use these characters:
   - `O` for live cells
   - `.` for dead cells
   - `!` for comments

Example `glider_gun.cells`:
```
!Name: Gosper Glider Gun
!Author: Bill Gosper
!The first known gun and the first known finite pattern with unbounded growth.
!www.conwaylife.com/wiki/Gosper_glider_gun

........................O...........
......................O.O...........
............OO......OO............OO
...........O...O....OO............OO
OO........O.....O...OO..............
OO........O...O.OO....O.O...........
..........O.....O.......O...........
...........O...O...................
............OO.....................
```

Load the pattern:
```mojo
def load_pattern(filename: String) -> Grid:
    # Implementation to load pattern from file
    pass

grid = load_pattern("patterns/glider_gun.cells")
```
