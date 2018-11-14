defmodule UniprocessEngine.IntegrationTest do
  use ExUnit.Case, async: true

  def assert_same_images(file1, file2) do
    file_contents1 = File.read!(file1)
    file_contents2 = File.read!(file2)

    assert file_contents1 == file_contents2,
           "#{inspect(file1)} and #{inspect(file2)} do not match"
  end

  test "small, red Mandelbrot" do
    params =
      Fractals.Params.process(
        output_directory: "test/images",
        params_filename: "test/inputs/small-red-mandelbrot.yml"
      )

    UniprocessEngine.generate(params)

    assert_same_images(
      "test/expected_outputs/small-red-mandelbrot.ppm",
      "test/images/small-red-mandelbrot.ppm"
    )

    assert File.exists?("test/images/small-red-mandelbrot.png")
  end
end
