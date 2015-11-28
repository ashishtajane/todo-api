defmodule TodoApp.ItemView do
  use TodoApp.Web, :view

  def render("index.json", %{items: items}) do
    %{data: render_many(items, TodoApp.ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, TodoApp.ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      text: item.text,
      done: item.done}
  end
end
