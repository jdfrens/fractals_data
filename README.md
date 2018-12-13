# Data Files for Specifying Fractals

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License"
style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International
License</a>.

YAML files that specify fractals.

These are used by
* https://github.com/jdfrens/fractals_elixir
* Some future solution written in Rust.

Read those repos for more information.

## Format

```yaml
fractal:
  type: Julia
  max_iterations: 255
  c: -0.5+-0.24254i
color:
  type: Random
  max_intensity: 255
image:
  size: 512x384
  upperLeft: -2.0+1.5i
  lowerRight: 2.0+-1.5i
engine:
  type: stage
  chunk_size: 128
output:
  directory: "images"
  filename: "julia-awesome.png"
```

Most everything has a default value.  Each object with a `type` may have their own options that you can set.

## History

I started with one repo for playing around with fractals in multiple programming languages:
https://github.com/jdfrens/mandelbrot.  My Elixir solution started to get a little too big to share the repo with other
languages, and
