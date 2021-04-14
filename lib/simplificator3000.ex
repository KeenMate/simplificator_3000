defmodule Simplificator3000 do
  def view do
    quote do
      @before_compile {unquote(__MODULE__), :view_before_compile}
    end
  end

  def layout do
    quote do
      def title(conn, assigns) do
        {:ok, application} = :application.get_application()
        app_name = Application.get_env(application, :page_title)

        case view_module(conn).page_title(view_template(conn), assigns) do
          title when is_binary(title) -> title <> " ・ " <> app_name
          _ -> app_name
        end
      end
    end
  end

  defmacro view_before_compile(_env) do
    quote do
      def page_title(_, _), do: nil
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
