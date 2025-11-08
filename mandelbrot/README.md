# Mandelbrot Set Configuration Files

This directory contains YAML configuration files for generating Mandelbrot set images.

## File Format

### Required Sections

#### 1. `fractal`
- **`type`** (required): Must be `"Mandelbrot"`
- **`max_iterations`** (optional): Integer specifying maximum iterations before considering a point inside the set
  - Default: `128` (if omitted)
  - Lower values (128-256): Faster rendering, less detail
  - Medium values (512-1024): Good balance
  - Higher values (2048+): More detail in deep zooms, slower rendering

#### 2. `color_scheme`
- **`type`** (required): One of the following:
  - `BlackOnWhite` - Black for inside, white for outside
  - `WhiteOnBlack` - White for inside, black for outside
  - `Gray` - Black for inside, grayscale gradient for outside
  - `Red` - Red-based color scheme
  - `Green` - Green-based color scheme
  - `Blue` - Blue-based color scheme

#### 3. `image`
- **`upperLeft`** (required): Complex number for upper-left corner of viewing window
  - Format: `real+imaginaryi` (e.g., `-2.0+1.2i`)
- **`lowerRight`** (required): Complex number for lower-right corner of viewing window
  - Format: `real+imaginaryi` (e.g., `1.2+-1.2i`)
- **`size`** (optional): Image dimensions in format `WIDTHxHEIGHT`
  - Default: `1024x768`
  - Example: `1920x1080`, `800x600`, `3840x2160`

### Complex Number Format

Complex numbers are specified as strings in the format: `real+imaginaryi`

Examples:
- `"-2.0+1.2i"` = -2.0 + 1.2i
- `"1.2+-1.2i"` = 1.2 - 1.2i
- `"-0.5+-0.5i"` = -0.5 - 0.5i
- `"0.0+0.0i"` = 0.0 + 0.0i

### Standard Viewing Windows

**Full Mandelbrot Set:**
```yaml
upperLeft: -2.0+1.2i
lowerRight: 1.2+-1.2i
```

**Symmetric Full View:**
```yaml
upperLeft: -2.5+1.5i
lowerRight: 1.5+-1.5i
```

**Interesting Regions to Explore:**
- Seahorse Valley: `upperLeft: -0.75+0.1i`, `lowerRight: -0.74+-0.1i`
- Spiral: `upperLeft: -0.7+0.3i`, `lowerRight: -0.6+0.2i`
- Mini Mandelbrot: `upperLeft: -0.16+1.04i`, `lowerRight: -0.14+1.02i`

## Example Files

- `mandelbrot-complete-example.yml` - Shows all available options with comments
- `mandelbrot-minimal.yml` - Minimal configuration using all defaults (128 iterations, 1024x768)
- `mandelbrot-with-max-iterations.yml` - Demonstrates explicit max_iterations value
- `mandelbrot-zoom-high-detail.yml` - High detail zoom with large iteration count

## Output

The parser generates PNG images in the `images/` directory. The filename is derived from the input YAML filename.

For example:
- Input: `data/mandelbrot/mandelbrot-red.yml`
- Output: `images/mandelbrot-red.png`
