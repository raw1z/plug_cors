defmodule PlugCors.Logger do
  require Logger

  defmacro __using__(_opts) do
    quote do
      require Logger
      require PlugCors.Logger
      alias PlugCors.Logger
    end
  end

  defmacro debug(chardata, metadata \\ []) do
    if is_logger_enabled do
      quote do: Logger.debug(unquote(chardata), unquote(metadata))
    end
  end

  defmacro info(chardata, metadata \\ []) do
    if is_logger_enabled do
      quote do: Logger.info(unquote(chardata), unquote(metadata))
    end
  end

  defmacro error(chardata, metadata \\ []) do
    if is_logger_enabled do
      quote do: Logger.error(unquote(chardata), unquote(metadata))
    end
  end

  defmacro warn(chardata, metadata \\ []) do
    if is_logger_enabled do
      quote do: Logger.warn(unquote(chardata), unquote(metadata))
    end
  end

  defp is_logger_enabled do
    case Application.get_env(:plug_cors, :debug) do
      true  ->
        true
      _ ->
        false
    end
  end
end

