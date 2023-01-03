defmodule Simplificator3000.StringHelpers do
  @anonymize_email_regex ~r/(?<=.)[^@\n](?=[^@\n]*[^@\n]@)|(?:(?<=@.)|(?!^)\G(?=[^@]*$)).(?!$)/
  @anonymize_phone_regex ~r/\d(?!\d{0,3}$)/
  @substitution_symbol "*"

  defguard is_nil_or_empty(str) when is_nil(str) or str == ""

  defguard is_not_nil_or_empty(str) when not is_nil_or_empty(str)

  @spec nil_or_empty?(binary) :: boolean
  def nil_or_empty?(str) do
    "" == str |> to_string() |> String.trim()
  end

  @spec nil_or_whitespace?(binary | nil) :: boolean
  def nil_or_whitespace?(str) when is_nil_or_empty(str), do: true

  def nil_or_whitespace?(str) do
    String.trim(str) == ""
  end

  @spec anonymize_email(binary) :: binary
  def anonymize_email(email) do
    Regex.replace(@anonymize_email_regex, email, @substitution_symbol)
  end

  @spec anonymize_phone(binary) :: binary
  def anonymize_phone(phone) do
    Regex.replace(@anonymize_phone_regex, phone, @substitution_symbol)
  end

  @camelize_regex ~r/(?:^|[-_])|(?=[A-Z][a-z])/

  def camelize(word, option \\ :upper) do
    case Regex.split(@camelize_regex, to_string(word)) do
      words ->
        words
        |> Enum.filter(&(&1 != ""))
        |> camelize_list(option)
        |> Enum.join()
    end
  end

  defp camelize_list([], _), do: []

  defp camelize_list([h | tail], :lower) do
    [lowercase(h)] ++ camelize_list(tail, :upper)
  end

  defp camelize_list([h | tail], :upper) do
    [capitalize(h)] ++ camelize_list(tail, :upper)
  end

  def capitalize(word), do: String.capitalize(word)
  def lowercase(word), do: String.downcase(word)

  def add_prefix(word, prefix) when is_atom(word) do
    add_prefix(Atom.to_string(word), prefix)
  end

  def add_prefix(word, prefix) do
    prefix <> word
  end
end
