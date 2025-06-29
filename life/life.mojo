
from python import Python
from gridv1 import Grid
import time


def grid_str2(grid: Grid) -> String:
    # Create an empty String
    str = String()

    # Iterate through rows 0 through rows-1
    for row in range(grid.rows):
        # Iterate through columns 0 through cols-1
        for col in range(grid.cols):
            if grid.data[row][col] == 1:
                str += "*"  # If cell is populated, append an asterisk
            else:
                str += " "  # If cell is not populated, append a space
        if row != grid.rows - 1:
            str += "\n"     # Add a newline between rows, but not at the end
    return str


def grid_str(rows: Int, cols: Int, grid: List[List[Int]]) -> String:
    # Create an empty String
    str = String()

    # Iterate through rows 0 through rows-1
    for row in range(rows):
        # Iterate through columns 0 through cols-1
        for col in range(cols):
            if grid[row][col] == 1:
                str += "*"  # If cell is populated, append an asterisk
            else:
                str += " "  # If cell is not populated, append a space
        if row != rows-1:
            str += "\n"     # Add a newline between rows, but not at the end
    return str


def run_display(
    owned grid: Grid,
    window_height: Int = 600,
    window_width: Int = 600,
    background_color: String = "black",
    cell_color: String = "green",
    pause: Float64 = 0.1,
) -> None:
    # Import the pygame Python package
    pygame = Python.import_module("pygame")

    # Initialize pygame modules
    pygame.init()

    # Create a window and set its title
    window = pygame.display.set_mode(
        Python.tuple(window_height, window_width)
    )
    pygame.display.set_caption("Conway's Game of Life")

    cell_height = window_height / grid.rows
    cell_width = window_width / grid.cols
    border_size = 1
    cell_fill_color = pygame.Color(cell_color)
    background_fill_color = pygame.Color(background_color)

    running = True
    while running:
        # Poll for events
        event = pygame.event.poll()
        if event.type == pygame.QUIT:
            # Quit if the window is closed
            running = False
        elif event.type == pygame.KEYDOWN:
            # Also quit if the user presses <Escape> or 'q'
            if event.key == pygame.K_ESCAPE or event.key == pygame.K_q:
                running = False

        # Clear the window by painting with the background color
        window.fill(background_fill_color)

        # Draw each live cell in the grid
        for row in range(grid.rows):
            for col in range(grid.cols):
                if grid[row, col]:
                    x = col * cell_width + border_size
                    y = row * cell_height + border_size
                    width = cell_width - border_size
                    height = cell_height - border_size
                    pygame.draw.rect(
                        window,
                        cell_fill_color,
                        Python.tuple(x, y, width, height),
                    )

        # Update the display
        pygame.display.flip()

        # Pause to let the user appreciate the scene
        time.sleep(pause)

        # Next generation
        grid = grid.evolve()

    # Shut down pygame cleanly
    pygame.quit()


def main():
    name = input("Who are you? ")
    greeting = "Hi, " + name + "!"
    print(greeting)
    
    # The List in row can contain only Int values
    row = List[Int]()

    # The List in names can contain only String values
    names = List[String]()

    # Create a List[Int] with the List constructor, inferring the type
    nums1 = List(12, -7, 64)

    # Create a List[Int] with the list literal syntax, inferring the type
    nums2 = [12, -7, 64]

    nums = [12, -7, 64]
    nums.append(-937)
    print("Number of elements in the list:", len(nums))
    print("Popping last element off the list:", nums.pop())
    print("First element of the list:", nums[0])
    print("Second element of the list:", nums[1])
    print("Last element of the list:", nums[-1])

    grid = [
        [11, 22],
        [33, 44]
    ]
    print("Row 0, Column 0:", grid[0][0])
    print("Row 0, Column 1:", grid[0][1])
    print("Row 1, Column 0:", grid[1][0])
    print("Row 1, Column 1:", grid[1][1])

    num_rows = 8
    num_cols = 8
    glider = [
        [0, 1, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
    ]


    result = grid_str(num_rows, num_cols, glider)
   # print(result)


    glider2 = [
        [0, 1, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
    ]

    start = Grid.random(128, 128)
    run_display(start)




