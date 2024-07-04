defmodule KinsulateCtlTest do
  use ExUnit.Case
  doctest KinsulateCtl

  test "greets the world" do
    assert KinsulateCtl.hello() == :world
  end
end
