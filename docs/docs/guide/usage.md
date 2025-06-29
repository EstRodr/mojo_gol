# User Guide: Basic Usage

This guide explains how to use the Mojo Game of Life simulation, covering basic operations, patterns, and customization.

## Running the Simulation

### Basic Command

```bash
# Run with default settings
mojo life/life.mojo

# Or build and run as an executable (optional)
mojo build life/life.mojo -o life/game_of_life
./life/game_of_life
```

This starts the simulation with default settings:
- 30x30 grid
- 10 FPS frame rate
- Random initial pattern

### Command Line Options

| Option | Description | Default |
|--------|-------------|---------|
| `--rows N` | Number of rows in the grid | 30 |
| `--cols N` | Number of columns in the grid | 30 |
| `--fps N` | Frames per second | 10 |
| `--cell-size N` | Size of each cell in pixels | 20 |
| `--alive-color COLOR` | Color of live cells (hex) | #4285F4 |
| `--dead-color COLOR` | Color of dead cells (hex) | #202124 |
| `--pattern NAME` | Initial pattern (random, glider, blinker) | random |

Example:
```bash
# Run with custom settings
mojo life/life.mojo --rows 50 --cols 80 --fps 15 --alive-color "#FF0000"

# Or with the built executable
./life/game_of_life --rows 50 --cols 80 --fps 15 --alive-color "#FF0000"
```

## Interactive Controls

| Key | Action |
|-----|--------|
| `Space` | Pause/Resume simulation |
| `Right Arrow` | Single step (when paused) |
| `R` | Reset with random pattern |
| `+` | Increase speed (decrease delay) |
| `-` | Decrease speed (increase delay) |
| `Q` or `ESC` | Quit the application |

## Working with Patterns

### Built-in Patterns

#### Glider
A lightweight spaceship that moves diagonally.

```mojo
# Add a glider at position (row, col)
create_glider(grid, row, col)
```

#### Blinker
Oscillates between horizontal and vertical lines.

```mojo
# Add a blinker at position (row, col)
create_blinker(grid, row, col)
```

### Creating Custom Patterns

You can create custom patterns by setting individual cells:

```mojo
# Create a custom pattern (e.g., a block)
grid[row, col] = 1
grid[row, col+1] = 1
grid[row+1, col] = 1
grid[row+1, col+1] = 1
```

Or use a 2D array pattern:

```mojo
let pattern = [
    [0, 1, 0],
    [0, 0, 1],
    [1, 1, 1]
]

# Apply pattern at position (start_row, start_col)
for i in range(len(pattern)):
    for j in range(len(pattern[0])):
        grid[start_row + i, start_col + j] = pattern[i][j]
```

## Advanced Usage

### Custom Initialization

Create a custom initialization function:

```mojo
def initialize_custom(grid: Grid) -> None:
    """Initialize the grid with a custom pattern."""
    # Clear the grid
    for i in range(grid.rows):
        for j in range(grid.cols):
            grid[i, j] = 0
    
    # Add custom patterns
    create_glider(grid, 1, 1)
    create_blinker(grid, 10, 10)
    
    # Add some random cells
    for _ in range(100):
        grid[random_int(0, grid.rows-1), random_int(0, grid.cols-1)] = 1
```

### Custom Simulation Loop

For more control, you can create a custom simulation loop:

```mojo
def custom_simulation():
    # Initialize grid
    let rows = 40
    let cols = 60
    var grid = Grid(rows, cols)
    initialize_custom(grid)
    
    # Set up display
    let window_height = 800
    let window_width = 1200
    let cell_size = min(
        window_height // rows,
        window_width // cols
    )
    
    # Main loop
    var running = True
    var paused = False
    var delay = 0.1  # seconds
    
    while running:
        # Handle events
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_SPACE:
                    paused = not paused
                elif event.key == pygame.K_ESCAPE or event.key == pygame.K_q:
                    running = False
                elif event.key == pygame.K_r:
                    grid = Grid.random(rows, cols)
                elif event.key == pygame.K_PLUS or event.key == pygame.K_EQUALS:
                    delay = max(0.01, delay * 0.9)
                elif event.key == pygame.K_MINUS:
                    delay = min(1.0, delay * 1.1)
        
        # Update simulation if not paused
        if not paused:
            grid = grid.evolve()
        
        # Draw the grid
        draw_grid(window, grid, cell_size)
        
        # Control speed
        time.sleep(delay)
```

## Performance Tips

1. **Grid Size**: Larger grids require more computation. Keep grid size reasonable for real-time simulation.
2. **Frame Rate**: Lower FPS values improve performance but make the animation less smooth.
3. **Visualization**: For very large grids, consider disabling visualization or using a lower cell size.
4. **Optimization**: The implementation uses a simple list of lists. For better performance with large grids, consider using NumPy arrays or a more optimized data structure.

## Common Patterns

### Oscillators
- Blinker (period 2)
- Toad (period 2)
- Beacon (period 2)
- Pulsar (period 3)

### Spaceships
- Glider
- LWSS (Lightweight spaceship)
- MWSS (Medium-weight spaceship)
- HWSS (Heavy-weight spaceship)

### Still Lifes
- Block
- Beehive
- Loaf
- Boat
- Ship

## Troubleshooting

### Common Issues

1. **Window not responding**
   - Ensure you're not running the simulation with too high FPS
   - Try reducing the grid size

2. **Patterns not appearing**
   - Check that coordinates are within grid bounds
   - Verify that the pattern isn't being immediately overwritten

3. **Performance issues**
   - Reduce grid size or FPS
   - Close other resource-intensive applications
   - Consider using a more powerful computer for large simulations
