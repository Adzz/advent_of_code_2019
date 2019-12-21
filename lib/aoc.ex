defmodule Aoc do
  @moduledoc """
  The solutions for Advent of Code 2019 in Elixir.
  """
  # This is the input for the first exercise
  @modules [
    70102,
    60688,
    105_331,
    127_196,
    141_253,
    118_164,
    67481,
    75634,
    60715,
    84116,
    51389,
    52440,
    84992,
    87519,
    85765,
    124_479,
    97873,
    85437,
    94902,
    124_969,
    70561,
    144_601,
    128_042,
    67596,
    136_905,
    111_849,
    100_389,
    135_608,
    91006,
    77385,
    52100,
    64728,
    127_796,
    114_893,
    82414,
    66565,
    73704,
    110_396,
    142_722,
    107_813,
    149_628,
    131_729,
    118_421,
    56566,
    84962,
    108_120,
    108_438,
    81536,
    55238,
    77072,
    132_575,
    82716,
    50641,
    57320,
    89661,
    97094,
    134_713,
    142_451,
    128_541,
    53527,
    116_088,
    101_909,
    124_349,
    103_812,
    108_324,
    72981,
    114_488,
    78738,
    78523,
    129_146,
    103_007,
    68506,
    102_227,
    93507,
    94557,
    105_867,
    125_514,
    109_130,
    146_102,
    100_876,
    143_549,
    85753,
    97589,
    90892,
    104_287,
    70930,
    53847,
    94687,
    135_370,
    76024,
    76156,
    101_006,
    128_349,
    58134,
    110_849,
    149_176,
    136_728,
    79054,
    136_740,
    131_081
  ]

  @doc "The challenge for day 1."
  def total_fuel_for_modules(modules \\ @modules) do
    modules
    |> Enum.reduce(0, fn module, acc ->
      total_module_fuel =
        fuel_for(module)
        # This part was the second gold star.
        |> plus_fuel_for_the_fuel()

      acc + total_module_fuel
    end)
  end

  defp plus_fuel_for_the_fuel(fuel) do
    fuel_for_the_fuel(fuel, fuel)
  end

  defp fuel_for_the_fuel(the_fuel, result) do
    if fuel_for(the_fuel) > 0 do
      fuel_for_the_fuel(fuel_for(the_fuel), result + fuel_for(the_fuel))
    else
      result
    end
  end

  defp fuel_for(module) do
    floor(module / 3) - 2
  end
end
