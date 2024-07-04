defmodule KinsulateCtl do
  @moduledoc """
  Documentation for `KinsulateCtl`.
  """
  use DoIt.MainCommand,
    description: "Kinsulate CLI Tool",
    version: "0.1.0"

  command(KinsulateCtl.Commands.Install)
  command(KinsulateCtl.Commands.Cell)
end
