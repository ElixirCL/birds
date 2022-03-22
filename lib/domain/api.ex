defmodule Birds.API.Bird do
  defstruct [:uid, :name, :image, :thumbnail, :description]
end

defmodule Birds.API do
  alias Birds.API.Bird

  @endpoint "https://aves.ninjas.cl/api/birds"

  def get do
    case HTTPoison.get(@endpoint) do
      {:ok, %{status_code: 200, body: body}} ->
        Jason.decode!(body)
        |> Enum.map(fn item ->
          %Bird{
            uid: item["uid"],
            name: item["name"]["latin"],
            image: item["images"]["full"],
            thumbnail: item["images"]["thumb"],
            description: item["name"]["spanish"]
          }
        end)

      {:ok, %{status_code: 404}} ->
        []

      {:error, %{reason: reason}} ->
        IO.inspect(reason)
        []
    end
  end
end
