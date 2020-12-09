defmodule QrGen do
  @moduledoc """
  Documentation for `QrGen`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> QrGen.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Creates labels for a given string and count.

  ## Examples

      iex> QrGen.create_labels_for("LAPTOP-0", 0, 100)
      {:ok, results}

  """
  @spec create_labels_for(binary, integer, integer) :: {:ok, [any]}
  def create_labels_for(label, min \\ 0, max \\ 100) do
    images =
      Enum.map(min..max, fn n ->
        %{
          image: (label <> to_string(n)) |> EQRCode.encode() |> EQRCode.png(),
          label: label <> to_string(n)
        }
      end)

    for %{image: image, label: label} <- images do
      File.touch(label <> ".png")
      File.write(label <> ".png", image, [:binary])
    end

    {:ok, images}
  end

  @spec create_laptop_labels(integer, integer) :: {:ok, [any]}
  def create_laptop_labels(min \\ 0, max \\ 100) do
    label = "LAPTOP-0"

    images =
      Enum.map(min..max, fn n ->
        %{
          image: (label <> to_string(n)) |> EQRCode.encode() |> EQRCode.png(),
          label: label <> to_string(n)
        }
      end)

    for %{image: image, label: label} <- images do
      File.touch(label <> ".png")
      File.write(label <> ".png", image, [:binary])
    end

    {:ok, images}
  end

  @spec create_desktop_labels(integer, integer) :: {:ok, [any]}
  def create_desktop_labels(min \\ 0, max \\ 100) do
    label = "DESKTOP-0"

    images =
      Enum.map(min..max, fn n ->
        %{
          image: (label <> to_string(n)) |> EQRCode.encode() |> EQRCode.png(),
          label: label <> to_string(n)
        }
      end)

    for %{image: image, label: label} <- images do
      File.touch(label <> ".png")
      File.write(label <> ".png", image, [:binary])
    end

    {:ok, images}
  end

  @spec create_monitor_labels(integer, integer) :: {:ok, [any]}
  def create_monitor_labels(min \\ 0, max \\ 0) do
    label = "MONITOR-0"

    images =
      Enum.map(min..max, fn n ->
        %{
          image: (label <> to_string(n)) |> EQRCode.encode() |> EQRCode.png(),
          label: label <> to_string(n)
        }
      end)

    for %{image: image, label: label} <- images do
      File.touch(label <> ".png")
      File.write(label <> ".png", image, [:binary])
    end

    {:ok, images}
  end
end
