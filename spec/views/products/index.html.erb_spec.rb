# <h1>
#   商品検索
# </h1>
# <%= search_form_for @p, url: products_search_path do |f| %>
#   <%= f.label :name_eq, '商品名' %>
# <%= f.collection_select :name_eq, @product_name, :name, :name, include_blank: '指定なし' %>
#   <br>
#   <%= f.submit '検索' %>
# <% end %>