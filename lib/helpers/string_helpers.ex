defmodule Simplificator3000.StringHelpers do
  @anonymize_email_regex ~r/(?<=.)[^@\n](?=[^@\n]*[^@\n]@)|(?:(?<=@.)|(?!^)\G(?=[^@]*$)).(?!$)/
  @anonymize_phone_regex ~r/\d(?!\d{0,3}$)/
  @substitution_symbol "*"

  defguard is_nil_or_empty(str) when is_nil(str) or str == ""

  defguard is_not_nil_or_empty(str) when not is_nil_or_empty(str)

  def nil_or_empty?(str) do
    "" == str |> to_string() |> String.trim()
  end

  def nil_or_whitespace?(str) when is_nil_or_empty(str), do: true

  def nil_or_whitespace?(str) do
    String.trim(str) == ""
  end

  def anonymize_email(email) when is_binary(email) do
    Regex.replace(@anonymize_email_regex, email, @substitution_symbol)
  end

  def anonymize_email(_) do
  end

  def anonymize_phone(phone) when is_binary(phone) do
    Regex.replace(@anonymize_phone_regex, phone, @substitution_symbol)
  end

  def anonymize_phone(_) do
  end
end
