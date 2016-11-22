defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_years = seconds/31557600
    convert(planet, earth_years)
  end

  def convert(:earth, earth_years), do: earth_years
  def convert(:mercury, earth_years), do: earth_years/0.2408467
  def convert(:venus, earth_years), do: earth_years/0.61519726
  def convert(:mars, earth_years), do: earth_years/1.8808158
  def convert(:jupiter, earth_years), do: earth_years/11.862615
  def convert(:saturn, earth_years), do: earth_years/29.447498
  def convert(:uranus, earth_years), do: earth_years/84.016846
  def convert(:neptune, earth_years), do: earth_years/164.79132
end
