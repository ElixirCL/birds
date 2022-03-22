defmodule BirdsWeb.Components.Bird do
  use Surface.Component

  prop bird, :struct, required: true

  def render(assigns) do
    ~F"""
    <article class="thumb">
        <a href={@bird.image} class="image"><img src={@bird.thumbnail} alt={@bird.name} /></a>
        <h2>{@bird.name}</h2>
        <p>{@bird.description}</p>
    </article>
    """
  end
end
