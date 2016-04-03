defmodule PhoenixTrello.GuardianSerializer do
  @behaviour Guardian.Serializer
  alias PhoenixTrello.{Repo, User}
  def for_token(user = %User{}), do: { :ok, "User:#{user.id}" }
  def for_token(_), do: { :error, "Unkown resource type" }

  def from_token("User:" <> id), do: { :ok, Repo.get(User, String_to_iteger(id)) }
  def from_token(_), do: { :error, "Unkown resource type" }
end
