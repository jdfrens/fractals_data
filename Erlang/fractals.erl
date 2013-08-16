% No warranty.  No guarantees of any sort.
% Creative Commons Attribution-Share Alike 3.0 United States License

-module(fractals).
-export([complexGrid/3, julia_iterator/1, mandelbrot/1, burningship/1, newton/1]).
-import(lib_misc, [pmap/2]).
-import(complex, [real/1, imag/1]).

-include("fractal_constants.hrl").

complexGrid([Width, Height], Z0, Z1) ->
    DeltaX = (real(Z1) - real(Z0)) / (Width - 1),
    DeltaY = (imag(Z1) - imag(Z0)) / (Height - 1),
    Xs = [real(Z0) + N * DeltaX || N <- lists:seq(0, Width - 1)],
    Ys = [imag(Z0) + N * DeltaY || N <- lists:seq(0, Height - 1)],
    [[complex:make(X, Y) || X <- Xs] || Y <- Ys].

mandelbrot(C) -> iteratePoint(fun z_squared_plus_c/2, C, complex:make(0.0, 0.0)).
julia_iterator(C) -> fun(Z) -> iteratePoint(fun z_squared_plus_c/2, C, Z) end.
burningship(C) -> iteratePoint(fun burningship_iterator/2, C, complex:make(0.0, 0.0)).
newton(Z) -> iteratePoint(fun newtonIterator/2, complex:make(0.0, 0.0), Z).

iteratePoint(Iterator, C, Z0) -> iteratePoint(Iterator, C, Z0, 0).
iteratePoint(Iterator, C, Z, I) ->
    Magnitude = complex:absolute(Z),
    if
        I == ?MAX_ITERS       -> { inside };
        Magnitude > ?MAX_SIZE -> { outside, Z, I };
        true                  -> iteratePoint(Iterator, C, Iterator(Z, C), I + 1)
    end.

z_squared_plus_c(Z, C) -> complex:add(complex:multiply(Z, Z), C).

burningship_iterator(Z, C) ->
  Burn = complex:make(abs(real(Z)), -abs(imag(Z))),
  complex:add(complex:multiply(Burn, Burn), C).

newtonIterator(Z, _) ->
    ZSquared = complex:multiply(Z, Z),
    complex:subtract(
        Z,
        complex:divide(
            complex:subtract(complex:multiply(ZSquared, Z), 1.0),
            complex:multiply(ZSquared, 3.0)
            )).