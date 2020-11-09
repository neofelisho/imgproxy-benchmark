defmodule ImgproxyBenchmarkTest do
  use ExUnit.Case
  alias ImgproxyBenchmark

  describe "imgproxy benchmark" do
    test "get_4mb_image" do
      run_benchmark("example_4mb.jpg")
    end

    test "get_7mb_image" do
      run_benchmark("example_7mb.jpg")
    end

    defp run_benchmark(filename) do
      Benchee.run(
        %{
          "imgproxy_#{filename}" => fn ->
            with {:ok, _response} <- ImgproxyBenchmark.get_image("localhost:///#{filename}") do
              true
            else
              _ -> false
            end
          end,
          "nginx_#{filename}" => fn ->
            with {:ok, _response} <- Mojito.get("http://localhost/images/#{filename}") do
              true
            else
              _ -> false
            end
          end
        },
        time: 10
      )
    end
  end
end
