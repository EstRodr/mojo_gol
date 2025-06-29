#!/usr/bin/env python3
"""
Screenshot Generator for Mojo Game of Life

This script generates screenshots of various Game of Life patterns
for use in the documentation.
"""

import os
import sys
import time
import argparse
import subprocess
from pathlib import Path

# Default paths
SCRIPT_DIR = Path(__file__).parent.absolute()
ROOT_DIR = SCRIPT_DIR.parent
PATTERNS_DIR = SCRIPT_DIR / "patterns"
SCREENSHOTS_DIR = ROOT_DIR / "docs" / "images" / "screenshots"

# Ensure screenshots directory exists
SCREENSHOTS_DIR.mkdir(parents=True, exist_ok=True)

def run_simulation(pattern_path, output_path, delay=1.0, rows=30, cols=40):
    """Run the simulation and take a screenshot."""
    # Build the command
    cmd = [
        "python3",
        str(ROOT_DIR / "life" / "game_of_life.py"),
        "--rows", str(rows),
        "--cols", str(cols),
        "--pattern", str(pattern_path),
        "--screenshot", str(output_path),
        "--fps", "1",
        "--generations", "1",
    ]
    
    print(f"Generating {output_path.name}...")
    
    try:
        subprocess.run(cmd, check=True, cwd=ROOT_DIR, timeout=10)
        print(f"  ✓ Saved to {output_path}")
    except subprocess.TimeoutExpired:
        print(f"  ⚠️  Timed out generating {output_path}")
    except subprocess.CalledProcessError as e:
        print(f"  ❌ Error generating {output_path}: {e}")

def generate_all_screenshots():
    """Generate screenshots for all patterns."""
    # List of patterns to generate screenshots for
    patterns = [
        ("glider.cells", 10, 10, "Glider"),
        ("blinker.cells", 5, 5, "Blinker"),
        ("glider_gun.cells", 20, 50, "Gosper Glider Gun"),
    ]
    
    print(f"Generating screenshots in {SCREENSHOTS_DIR}")
    print("-" * 50)
    
    for pattern_file, rows, cols, name in patterns:
        pattern_path = PATTERNS_DIR / pattern_file
        if not pattern_path.exists():
            print(f"⚠️  Pattern not found: {pattern_path}")
            continue
            
        output_path = SCREENSHOTS_DIR / f"{pattern_file}.png"
        run_simulation(pattern_path, output_path, rows=rows, cols=cols)
    
    print("\nScreenshot generation complete!")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate screenshots of Game of Life patterns.")
    parser.add_argument("--pattern", help="Specific pattern file to generate")
    parser.add_argument("--output", help="Output file path")
    parser.add_argument("--rows", type=int, default=30, help="Number of rows in the grid")
    parser.add_argument("--cols", type=int, default=40, help="Number of columns in the grid")
    
    args = parser.parse_args()
    
    if args.pattern and args.output:
        # Generate a single screenshot
        run_simulation(
            Path(args.pattern).absolute(),
            Path(args.output).absolute(),
            rows=args.rows,
            cols=args.cols
        )
    else:
        # Generate all screenshots
        generate_all_screenshots()
