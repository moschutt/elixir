defmodule Discuss.TopicController do
  # ??? Mark Comment ???
  # This runs the controller function in the web/web.ex file which
  # performs all the necessary aliase, import and use calls to 
  # provide all the required functionaliry for a controller
  use Discuss.Web, :controller
  # So we can access below as Topic instead of Discuss.Topic
  alias Discuss.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    # ??? Mark Comment ???
    # In template we reference @changeset and @conn, to provide these
    #   values, pass them in as named arguments to the render function
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    render conn, "create.html"
  end
end
