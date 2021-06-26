defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver
  import_types(WabanexWeb.Schema.Types.User)

  object :root_query do
    field(:get_user, type: :user) do
      # Since we already import type uuid4 in user and as we import user here, so
      # uuid4 type is automatically imported with user
      arg(:id, non_null(:uuid4))

      resolve(&UserResolver.get/2)
    end
  end

  object :root_mutation do
    field(:create_user, type: :user) do
      arg(:input, non_null(:create_user_input))

      resolve(&UserResolver.create/2)
    end
  end

end
