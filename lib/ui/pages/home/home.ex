defmodule BirdsWeb.Home do
  use Surface.LiveView

  alias BirdsWeb.Components.Bird
  alias Birds.API

  data birds, :map

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :birds, API.get())}
  end

  @impl true
  def render(assigns) do
    ~F"""
      <!-- Main -->
      <div id="main">
        {#for bird <- @birds}
          <Bird bird={bird} />
        {/for}
      </div>
    """
  end
end
