# Game of Life Pattern Examples

This directory contains example patterns for Conway's Game of Life that you can use with the Mojo implementation. Each pattern is stored in a `.cells` file, which is a simple text-based format for storing Game of Life patterns.

## Pattern Files

### Available Patterns

| Pattern | File | Description |
|---------|------|-------------|
| Glider | [glider.cells](patterns/glider.cells) | A lightweight spaceship that moves diagonally |
| Blinker | [blinker.cells](patterns/blinker.cells) | A period 2 oscillator |
| Gosper Glider Gun | [glider_gun.cells](patterns/glider_gun.cells) | A pattern that produces gliders indefinitely |

## Loading Patterns

You can load these patterns into the Game of Life simulation using the `--pattern` argument:

```bash
# Load the glider pattern
./life/game_of_life --pattern examples/patterns/glider.cells

# Load the Gosper Glider Gun
./life/game_of_life --rows 50 --cols 80 --pattern examples/patterns/glider_gun.cells
```

## Pattern File Format

The `.cells` file format is simple:
- `O` represents a live cell
- `.` represents a dead cell (or empty space)
- `!` starts a comment line
- All other characters are ignored

Example (blinker.cells):
```
! This is a comment
OOO  ! Three live cells in a row
```

## Creating Your Own Patterns

1. Create a new `.cells` file in the `patterns` directory
2. Use `O` for live cells and `.` for dead cells
3. Add comments with `!` to describe your pattern
4. Load it with the `--pattern` argument

## Pattern Collections

For more patterns, check out these resources:

- [ConwayLife.com Pattern Collection](https://conwaylife.com/patterns/)
- [Catagolue](https://catagolue.hatsya.com/)
- [LifeWiki Patterns](https://www.conwaylife.com/wiki/Category:Patterns)

## Pattern Categories

### Still Lifes
- Block
- Beehive
- Loaf
- Boat
- Ship

### Oscillators
- Blinker (period 2)
- Toad (period 2)
- Beacon (period 2)
- Pulsar (period 3)
- Pentadecathlon (period 15)

### Spaceships
- Glider (period 4, speed c/4 orthogonal)
- LWSS (Lightweight spaceship)
- MWSS (Medium-weight spaceship)
- HWSS (Heavy-weight spaceship)

### Guns
- Gosper Glider Gun
- Simkin Glider Gun
- Gosper's p8 gun

### Other Patterns
- R-pentomino
- Diehard (disappears after 130 generations)
- Acorn (takes 5206 generations to stabilize)

## Using Patterns in Code

You can also load patterns programmatically:

```mojo
from life import Grid, load_pattern

# Load a pattern from file
grid = load_pattern("examples/patterns/glider.cells")

# Or create patterns directly
def create_glider(grid: Grid, row: Int, col: Int) -> None:
    grid[row, col+1] = 1
    grid[row+1, col+2] = 1
    grid[row+2, col] = 1
    grid[row+2, col+1] = 1
    grid[row+2, col+2] = 1
```

## Contributing Patterns

Feel free to submit your own patterns via pull requests! Please:

1. Add your pattern to the `patterns` directory
2. Include a descriptive filename
3. Add comments with the pattern name and any relevant information
4. Update this README if you're adding a new category of patterns
