defmodule Wabanex.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @repetitions_regex ~r/\d+x\d+/
  @ytb_video_regex ~r/http(?:s?):\/\/(?:www\.)?youtu(?:be\.com\/watch\?v=|\.be\/)([\w\-\_]*)(&(amp;)?‌​[\w\?‌​=]*)?/

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:name, :youtube_video_url, :protocol_description, :repetitions]

  schema "exercises" do
    field :name, :string
    field :youtube_video_url, :string
    field :protocol_description, :string
    field :repetitions, :string

    belongs_to :training, Training

    timestamps()
  end

  def changeset(exercise, params) do
    exercise
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:repetitions, @repetitions_regex)
    |> validate_format(:youtube_video_url, @ytb_video_regex)
  end
end
