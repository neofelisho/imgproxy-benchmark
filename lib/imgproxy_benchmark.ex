defmodule ImgproxyBenchmark do
  @moduledoc """
  ImgproxyBenchmark keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def get_image(local_path) do
    with {:ok, response} <-
           local_path
           |> get_url()
           |> Mojito.get() do
      {:ok, response}
    else
      {:error, err} -> {:error, err}
    end
  end

  def get_url(path) do
    Imgproxy.url(path,
      resize: "fit",
      width: 800,
      height: 800,
      gravity: "sm",
      enlarge: "1",
      extension: "jpg"
    )
  end
end
