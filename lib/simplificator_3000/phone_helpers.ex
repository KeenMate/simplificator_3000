defmodule Simplificator3000.PhoneHelpers do
  import Simplificator3000.StringHelpers, only: [is_nil_or_empty: 1]

  @known_country_codes ~w(49 45 31 420)

  def valid_phone?(phone, nullable \\ false)

  def valid_phone?(nil, nullable), do: nullable

  def valid_phone?(phone, _nullable) when not is_binary(phone), do: false

  def valid_phone?("+49" <> phone, _nullable) do
    Regex.match?(~r/^\d{3,}$/, String.trim(phone))
  end

  def valid_phone?("+45" <> phone, _nullable) do
    Regex.match?(~r/^\d{8}$/, String.trim(phone))
  end

  def valid_phone?("+31" <> phone, _nullable) do
    Regex.match?(~r/^\d{9}$/, String.trim(phone))
  end

  def valid_phone?(phone, _nullable) do
    Regex.match?(~r/^\+\d{1,3} \d{3,}$/, String.trim(phone))
  end

  def normalize_phone(phone) when is_nil_or_empty(phone) do
    nil
  end

  def normalize_phone(phone, known_country_codes \\ @known_country_codes) do
    phone =
      phone
      |> remove_plus_sign()
      |> normalize_phone_number()

    country_code =
      known_country_codes
      |> Enum.filter(&String.starts_with?(phone, &1))
      |> List.first()

    case country_code do
      nil ->
        nil

      country_code ->
        rest_phone = String.slice(phone, String.length(country_code)..-1)
        "+#{country_code} #{rest_phone}"
    end
  end

  defp normalize_phone_number(phone_number) do
    String.replace(phone_number, ~r/[\s\-\(\)\.a-zA-Z\/\\\$\#\@\_\!\&\*\%]/, "", global: true)
  end

  defp remove_plus_sign(phone) do
    Regex.replace(~r/^\+|00/, phone, "")
  end
end
