defmodule Discuss.Topic do
  use Discuss.Web, :model

  # ??? Mark note ???
  # All models must implement 2 things
  
  # Tells phoenix what's in Postgres
  schema "topics" do
    field :title, :string
  end

  # Also include validation code.
  # struct is what is in DB
  # params is what we want record to be
  #
  # case produces a changeset between what we have (struct) and what 
  #   we want (params)
  #
  # validate_required (can be others) checks if the change is valid and
  # returns a new changeset.
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end

end
