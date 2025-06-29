# Life Module API Reference

This document provides detailed API reference for the `life.mojo` module, which implements Conway's Game of Life simulation with visualization.

## Overview

The `life` module provides functionality to run and visualize Conway's Game of Life simulation. It includes the main simulation logic, grid management, and Pygame-based visualization.

## Grid Class

### `Grid`

A 2D grid representing the Game of Life simulation state.

```mojo
struct Grid(Copyable, Movable, StringableRaising)
```

#### Fields
- `rows: Int` - Number of rows in the grid
- `cols: Int` - Number of columns in the grid
- `data: List[List[Int]]` - 2D list representing cell states (0 = dead, 1 = alive)

#### Methods

##### `__init__(rows: Int, cols: Int) -> Self`
Create a new grid with the specified dimensions.

##### `random(rows: Int, cols: Int) -> Self`
Create a new grid with random cell states.

##### `__getitem__(row: Int, col: Int) -> Int`
Get the state of a cell at (row, col).

##### `__setitem__(row: Int, col: Int, value: Int) -> None`
Set the state of a cell at (row, col).

##### `evolve() -> Self`
Compute the next generation of the grid based on Conway's rules.

##### `count_live_neighbors(row: Int, col: Int) -> Int`
Count the number of live neighbors around a cell.

## Functions

### `run_display`

Run the Game of Life simulation with visualization.

```mojo
def run_display(
    owned grid: Grid,
    window_height: Int = 600,
    window_width: Int = 600,
    background_color: String = "black",
    cell_color: String = "green",
    pause: Float64 = 0.1,
) -> None
```

#### Parameters
- `grid`: The initial grid state
- `window_height`: Height of the display window in pixels
- `window_width`: Width of the display window in pixels
- `background_color`: Background color (Pygame color string or hex)
- `cell_color`: Color of live cells (Pygame color string or hex)
- `pause`: Time in seconds between generations

### `grid_str`

Convert a grid to a string representation.

```mojo
def grid_str(rows: Int, cols: Int, grid: List[List[Int]]) -> String
```

#### Parameters
- `rows`: Number of rows in the grid
- `cols`: Number of columns in the grid
- `grid`: 2D list of cell states

#### Returns
A string representation of the grid ('*' for live cells, ' ' for dead cells)

## Example Usage

```mojo
from life import Grid, run_display

def main():
    # Create a 40x40 grid with a glider pattern
    let rows = 40
    let cols = 40
    var grid = Grid(rows, cols)
    
    # Add a glider
    let center_row = rows // 2
    let center_col = cols // 2
    grid[center_row, center_col + 1] = 1
    grid[center_row + 1, center_col + 2] = 1
    grid[center_row + 2, center_col] = 1
    grid[center_row + 2, center_col + 1] = 1
    grid[center_row + 2, center_col + 2] = 1
    
    # Run the simulation
    run_display(
        grid,
        window_height=800,
        window_width=800,
        cell_color="#00FF00",
        background_color="#000000",
        pause=0.05
    )
```

## Keyboard Controls

When the simulation is running, you can use the following controls:

- `Space`: Pause/Resume the simulation
- `Right Arrow`: Single step (when paused)
- `R`: Reset the simulation with a new random pattern
- `+`: Increase simulation speed
- `-`: Decrease simulation speed
- `Q` or `ESC`: Quit the application

## Performance Considerations

The implementation uses Mojo's performance features:
- Efficient memory management
- Inline operations where possible
- Optimized grid operations

For larger grids, consider adjusting the `pause` parameter to maintain smooth visualization.
