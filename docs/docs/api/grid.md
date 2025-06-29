# Grid API Reference

## Grid Class

The `Grid` class represents a 2D grid for Conway's Game of Life simulation.

```mojo
struct Grid(Copyable, Movable, StringableRaising)
```

### Constructor

#### `Grid(rows: Int, cols: Int) -> Self`
Create a new grid with the specified dimensions.

**Parameters:**
- `rows`: Number of rows in the grid (must be > 0)
- `cols`: Number of columns in the grid (must be > 0)

**Returns:**
A new Grid instance with all cells initialized to 0 (dead).

### Static Methods

#### `random(rows: Int, cols: Int) -> Self`
Create a new grid with random cell states.

**Parameters:**
- `rows`: Number of rows in the grid
- `cols`: Number of columns in the grid

**Returns:**
A new Grid instance with randomly initialized cell states.

### Instance Methods

#### `__getitem__(row: Int, col: Int) -> Int`
Get the state of a cell at the specified position.

**Parameters:**
- `row`: Row index (0-based)
- `col`: Column index (0-based)

**Returns:**
`1` if the cell is alive, `0` if dead.

**Raises:**
- `IndexError` if indices are out of bounds

#### `__setitem__(row: Int, col: Int, value: Int) -> None`
Set the state of a cell at the specified position.

**Parameters:**
- `row`: Row index (0-based)
- `col`: Column index (0-based)
- `value`: `1` for alive, `0` for dead

**Raises:**
- `IndexError` if indices are out of bounds
- `ValueError` if value is not 0 or 1

#### `evolve() -> Self`
Compute the next generation of the grid based on Conway's rules:
1. Any live cell with fewer than two live neighbors dies (underpopulation)
2. Any live cell with two or three live neighbors lives on
3. Any live cell with more than three live neighbors dies (overpopulation)
4. Any dead cell with exactly three live neighbors becomes a live cell (reproduction)

**Returns:**
A new Grid instance representing the next generation.

#### `count_live_neighbors(row: Int, col: Int) -> Int`
Count the number of live neighbors around a cell.

**Parameters:**
- `row`: Row index of the cell
- `col`: Column index of the cell

**Returns:**
Number of live neighbors (0-8)

### Properties

#### `rows: Int` (readonly)
Number of rows in the grid.

#### `cols: Int` (readonly)
Number of columns in the grid.

### Example Usage

```mojo
# Create a 10x10 grid
var grid = Grid(10, 10)

# Set some cells to alive
grid[1, 2] = 1
grid[2, 3] = 1
grid[3, 1] = 1
grid[3, 2] = 1
grid[3, 3] = 1

# Get the next generation
let next_gen = grid.evolve()

# Create a random 20x20 grid
let random_grid = Grid.random(20, 20)
```

## Grid Utility Functions

### `grid_str(grid: Grid) -> String`
Convert a grid to a string representation.

**Parameters:**
- `grid`: The grid to convert

**Returns:**
A string where each row is on a new line, ' ' represents a dead cell, and '*' represents a live cell.

### `create_glider(grid: Grid, row: Int, col: Int) -> None`
Initialize a glider pattern at the specified position.

**Parameters:**
- `grid`: The grid to modify
- `row`: Top row of the glider pattern
- `col`: Left column of the glider pattern

### `create_blinker(grid: Grid, row: Int, col: Int) -> None`
Initialize a blinker pattern at the specified position.

**Parameters:**
- `grid`: The grid to modify
- `row`: Top row of the blinker pattern
- `col`: Left column of the blinker pattern

## Performance Notes

- The grid uses a list of lists for storage, which provides good performance for small to medium-sized grids.
- For very large grids, consider using a more memory-efficient data structure.
- The `evolve()` method creates a new grid rather than modifying in-place to maintain consistency with functional programming principles.
