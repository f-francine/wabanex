defmodule WabanexWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: Wabanex.get_user(user_id)

  def create(%{input: params}, _context),
    do: Wabanex.create_user(params)
end
