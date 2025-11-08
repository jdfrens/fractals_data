# Julia Set Configuration Files

This directory contains YAML configuration files for generating Julia set images.

## File Format

### Required Sections

#### 1. `fractal`
- **`type`** (required): Must be `"Julia"`
- **`c`** (required): Complex number constant that defines which Julia set to render
  - Format: `real+imaginaryi` (e.g., `-0.7+0.27015i`)
  - Different values produce completely different fractals
  - See "Classic Julia Set Constants" below for interesting values
- **`max_iterations`** (optional): Integer specifying maximum iterations
  - Default: `128` (if omitted)
  - Lower values (64-128): Faster rendering, simpler appearance
  - Medium values (256-512): Good balance
  - Higher values (1024+): More detail, slower rendering

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
  - Format: `real+imaginaryi` (e.g., `-2.0+1.5i`)
- **`lowerRight`** (required): Complex number for lower-right corner of viewing window
  - Format: `real+imaginaryi` (e.g., `2.0+-1.5i`)
- **`size`** (optional): Image dimensions in format `WIDTHxHEIGHT`
  - Default: `1024x768`
  - Example: `1920x1080`, `800x600`, `1024x1024`

### Complex Number Format

Complex numbers are specified as strings in the format: `real+imaginaryi`

Examples:
- `"-0.7+0.27015i"` = -0.7 + 0.27015i
- `"0.0+1.0i"` = 0.0 + 1.0i (pure imaginary)
- `"-0.75+0.0i"` = -0.75 + 0.0i (pure real)
- `"-0.123+0.745i"` = -0.123 + 0.745i

### Standard Viewing Windows

**Full Symmetric View (most Julia sets):**
```yaml
upperLeft: -2.0+1.5i
lowerRight: 2.0+-1.5i
```

**Centered Square (for symmetric patterns):**
```yaml
upperLeft: -1.5+1.5i
lowerRight: 1.5+-1.5i
```

**Tighter View (for detailed exploration):**
```yaml
upperLeft: -1.0+1.0i
lowerRight: 1.0+-1.0i
```

### Classic Julia Set Constants

The `c` parameter completely determines the appearance of the Julia set. Here are some classic values:

**Connected Julia Sets:**
- `c: -0.7+0.27015i` - "Douady's rabbit" - produces rabbit-like shapes
- `c: -0.123+0.745i` - Connected set with spiral arms
- `c: -0.75+0.0i` - "San Marco" fractal - basilica-like pattern
- `c: -0.4+0.6i` - Connected set with interesting tendrils
- `c: 0.285+0.01i` - Near the boundary, complex structure

**Disconnected Julia Sets (Cantor dust):**
- `c: 0.0+1.0i` - "Dendrite" - tree-like pattern
- `c: -1.0+0.0i` - Dust pattern
- `c: 0.3+0.5i` - Scattered dust with structure

**Near-Circular:**
- `c: -0.1+0.65i` - Nearly circular boundary
- `c: 0.0+0.8i` - Circular with perturbations

**Highly Connected:**
- `c: -0.8+0.156i` - Connected with long tendrils
- `c: -0.835+-0.2321i` - Connected with intricate detail

### Julia Sets and the Mandelbrot Set

The Julia set for a given `c` value is related to the Mandelbrot set:
- If `c` is **inside** the Mandelbrot set → Julia set is **connected** (one piece)
- If `c` is **outside** the Mandelbrot set → Julia set is **disconnected** (dust-like)
- If `c` is **on the boundary** → Julia set has interesting, complex structure

## Example Files

- `julia-complete-example.yml` - Shows all available options with comments
- `julia-minimal.yml` - Minimal configuration using defaults
- `julia-high-detail.yml` - High detail "San Marco" fractal
- `julia-dendrite.yml` - Classic dendrite pattern

## Output

The parser generates PNG images in the `images/` directory. The filename is derived from the input YAML filename.

For example:
- Input: `data/julia/julia-dendrite.yml`
- Output: `images/julia-dendrite.png`

## Tips for Exploration

1. **Start with classic c values** to understand Julia set behavior
2. **Use higher max_iterations** (512-1024) for c values near the Mandelbrot boundary
3. **Try symmetric viewing windows** - Julia sets are typically centered at the origin
4. **Experiment with different color schemes** to highlight different features
5. **Use square dimensions** (e.g., 1024x1024) for patterns with radial symmetry
