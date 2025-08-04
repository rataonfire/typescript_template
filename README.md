# TypeScript Template

A modern TypeScript project template with ESLint, Prettier, and strict type checking pre-configured.

## Features

- **TypeScript 5.8.3** with strict mode enabled
- **ESLint** with Google style guide and TypeScript rules
- **Prettier** for consistent code formatting
- **Pre-configured scripts** for linting, formatting, and type checking
- **Modern ES2022** target with ESNext modules
- **Zero configuration** - just run the setup script

## Prerequisites

Before running the setup script, ensure you have the following installed:

### Node.js and npm

#### macOS
```bash
# Using Homebrew
brew install node

# Or download from https://nodejs.org/
```

#### Ubuntu/Debian
```bash
# Using NodeSource repository (recommended)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Or using snap
sudo snap install node --classic
```

#### Windows
```bash
# Using Chocolatey
choco install nodejs

# Or download installer from https://nodejs.org/
```

#### Other Linux distributions
```bash
# Using nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts
```

### jq (JSON processor)

#### macOS
```bash
brew install jq
```

#### Ubuntu/Debian
```bash
sudo apt-get update
sudo apt-get install jq
```

#### Windows
```bash
# Using Chocolatey
choco install jq

# Or download from https://stedolan.github.io/jq/download/
```

#### Other Linux distributions
```bash
# Most distributions
sudo yum install jq  # RHEL/CentOS/Fedora
sudo pacman -S jq    # Arch Linux
sudo zypper install jq # openSUSE
```

### Verify Installation
```bash
node --version  # Should output v16.x.x or higher
npm --version   # Should output 8.x.x or higher
jq --version    # Should output jq-1.x
```

## Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/rataonfire/typescript_template.git
   cd typescript_template
   ```

2. **Run the setup script**
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

3. **Create your source directory**
   ```bash
   mkdir -p src
   echo 'console.log("Hello, TypeScript!");' > src/index.ts
   ```

4. **Start coding!**

## Project Structure

After setup, your project will have the following structure:

```
typescript_template/
├── src/              # Your TypeScript source files
├── node_modules/     # Dependencies
├── .eslintrc.json    # ESLint configuration
├── .prettierrc.json  # Prettier configuration
├── tsconfig.json     # TypeScript configuration
├── package.json      # Project metadata and scripts
├── package-lock.json # Dependency lock file
└── setup.sh         # Setup script
```

## Available Scripts

The setup script configures the following npm scripts:

- **`npm run type-check`** - Run TypeScript compiler without emitting files
- **`npm run lint`** - Check code with ESLint
- **`npm run lint:fix`** - Fix auto-fixable ESLint issues
- **`npm run format`** - Format code with Prettier
- **`npm run format:check`** - Check if code is formatted
- **`npm run check-all`** - Run all checks (type-check, lint, format:check)
- **`npm run fix-all`** - Fix all auto-fixable issues
- **`npm run pre-commit`** - Run before committing (alias for fix-all)
- **`npm run ci`** - Run in CI/CD pipelines (alias for check-all)

## Configuration Details

### TypeScript Configuration

- **Target**: ES2022
- **Module**: ESNext with bundler resolution
- **Strict mode**: Enabled
- **Type checking**: Strict with all checks enabled

### ESLint Configuration

- Extends Google style guide
- TypeScript recommended rules
- Prettier integration
- JSDoc requirements disabled (TypeScript provides type information)

### Prettier Configuration

- Semicolons: Required
- Single quotes: Enabled
- Tab width: 2 spaces
- Trailing commas: ES5 style
- Bracket spacing: Disabled
- Arrow parens: Avoid when possible

## Usage Examples

### Basic TypeScript file

```typescript
// src/greet.ts
export function greet(name: string): string {
  return `Hello, ${name}!`;
}

// src/index.ts
import {greet} from './greet';

console.log(greet('World'));
```

### Running checks

```bash
# Check types
npm run type-check

# Check and fix formatting
npm run format

# Run all checks before committing
npm run pre-commit
```

## Customization

### Adding Dependencies

```bash
# Add runtime dependencies
npm install express

# Add type definitions
npm install --save-dev @types/express
```

### Modifying Configuration

- Edit `tsconfig.json` for TypeScript settings
- Edit `.eslintrc.json` for linting rules
- Edit `.prettierrc.json` for formatting preferences

## Troubleshooting

### Common Issues

1. **Permission denied when running setup.sh**
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

2. **jq command not found**
   - Install jq using the instructions above for your platform

3. **ESLint parsing errors**
   - Ensure all TypeScript files are in the `src/` directory
   - Check that `tsconfig.json` includes your files

4. **Module resolution issues**
   - Use `.ts` extensions in import statements
   - Ensure `moduleResolution` is set to `bundler` in tsconfig.json

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- Based on TypeScript best practices
- Uses Google's JavaScript style guide
- Prettier for opinionated code formatting
