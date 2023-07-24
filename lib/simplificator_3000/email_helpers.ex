defmodule Simplificator3000.EmailHelpers do
  @email_regex ~r/^[\w\.\d_\-\+]+@[\w\.\d_\-]+\.\w+$/

  def valid_email?(email, nullable \\ false)

  def valid_email?(nil, nullable), do: nullable

  def valid_email?(email, _nullable) when not is_binary(email), do: false

  def valid_email?(email, _nullable) do
    Regex.match?(@email_regex, email)
  end
end
