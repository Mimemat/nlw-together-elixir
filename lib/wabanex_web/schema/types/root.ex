defmodule WabanexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors

  alias WabanexWeb.Schema.Types
  alias WabanexWeb.Resolvers

  alias Resolvers.User, as: UserResolver
  alias Resolvers.Training, as: TrainingResolver

  import_types WabanexWeb.Schema.Types.Custom.UUID4

  import_types Types.User
  import_types Types.Training

  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :data, non_null(:create_user_input)

      resolve &UserResolver.create/2

      middleware TranslateErrors
    end

    field :create_training, type: :training do
      arg :data, non_null(:create_training_input)
      arg :token, non_null(:string)

      resolve &TrainingResolver.create/2

      middleware TranslateErrors
    end

    field :login, type: :token do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &UserResolver.login/2
    end
  end
end
