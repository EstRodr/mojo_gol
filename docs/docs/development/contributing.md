# Contributing to Mojo Game of Life

Thank you for your interest in contributing to the Mojo Game of Life project! This guide will help you get started with contributing code, documentation, or bug reports.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Environment](#development-environment)
- [Code Style](#code-style)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)
- [Reporting Bugs](#reporting-bugs)
- [Feature Requests](#feature-requests)
- [License](#license)

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the [issue tracker](https://github.com/yourusername/mojo-game-of-life/issues) to see if the problem has already been reported.

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. Create an issue and provide the following information:
- A clear and descriptive title
- A step-by-step description of the suggested enhancement
- Examples of the new feature in action
- Any additional context or screenshots

### Your First Code Contribution

Unsure where to begin? You can start by looking through the `good first issue` and `help wanted` issues:
- [Good first issues](https://github.com/yourusername/mojo-game-of-life/labels/good%20first%20issue)
- [Help wanted](https://github.com/yourusername/mojo-game-of-life/labels/help%20wanted)

## Development Environment

### Prerequisites

- [Mojo SDK](https://docs.modular.com/mojo/)
- Python 3.8+
- [Pixi](https://pixi.sh/) (recommended)
- [Pygame](https://www.pygame.org/) (for visualization)

### Setting Up

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/yourusername/mojo-game-of-life.git
   cd mojo-game-of-life
   ```
3. Set up the development environment:
   ```bash
   cd life
   pixi install
   ```

## Code Style

### Mojo Code

Follow the [Mojo Style Guide](https://docs.modular.com/mojo/style-guide.html) with these additions:

- Use 4 spaces for indentation
- Maximum line length of 100 characters
- Use snake_case for variables and functions
- Use PascalCase for types and classes
- Document all public APIs with docstrings

### Python Code

Follow [PEP 8](https://www.python.org/dev/peps/pep-0008/) for any Python code.

### Git Commit Messages

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally
- Consider starting the commit message with an applicable emoji:
  - 🎨 `:art:` when improving the format/structure of the code
  - 🐛 `:bug:` when fixing a bug
  - 🔥 `:fire:` when removing code or files
  - 💚 `:green_heart:` when fixing the CI build
  - 📝 `:memo:` when writing docs
  - 🚀 `:rocket:` when improving performance
  - 🎉 `:tada:` when beginning a project
  - ✅ `:white_check_mark:` when adding tests

## Testing

### Running Tests

```bash
# Run all tests
mojo test life/tests/

# Run a specific test file
mojo test life/tests/test_grid.mojo
```

### Writing Tests

- Create test files in the `life/tests/` directory
- Use descriptive test function names
- Test both success and failure cases
- Keep tests independent and isolated

## Pull Request Process

1. Fork the repository and create your branch from `main`
2. If you've added code that should be tested, add tests
3. If you've changed APIs, update the documentation
4. Ensure the test suite passes
5. Make sure your code lints
6. Issue that pull request!

## Reporting Bugs

Use the [GitHub issue tracker](https://github.com/yourusername/mojo-game-of-life/issues) to report bugs. Please include:

1. A clear and descriptive title
2. Steps to reproduce the issue
3. Expected behavior
4. Actual behavior
5. Screenshots if applicable
6. Your environment (OS, Mojo version, etc.)

## Feature Requests

Feature requests are welcome! Please open an issue to discuss your idea before writing code.

## License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE).

## Attribution

This guide was adapted from the [Atom](https://github.com/atom/atom/blob/master/CONTRIBUTING.md) contribution guidelines.
