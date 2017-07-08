Rails.application.routes.draw do

  root 'landing#home'

  get '/welcome', to: 'landing#home'

  get '/sign_in', to: 'session#sign_in'
  post '/attempt_sign_in', to: 'session#attempt_sign_in'
  get '/attempt_sign_out', to: 'session#attempt_sign_out'

  get '/home', to: 'profile#home'
  get '/options', to: 'profile#settings'
  get 'visiting/:username', to: 'profile#other_user'

  resources :user_identifications, :param => "username", :except => [:index] do
    member do
      get :delete
    end
  end

  resources :journal_entries, :only => [:new, :create, :index, :destroy] do
    member do
      get :delete
    end
  end

  # resources :user_identifications, :param => "username" do
    # member do
      # get :delete
    # end

    # resources :journal_entries, :except => [:edit, :update] do
      # member do
        # get :delete
      # end
    # end

  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# <table>
  # <% @journal_entries.each do |journal_entry| %>
  # <tr>
    # <td><%= journal_entry.entry_created_at %></td>
    # <td><%= journal_entry.entry %></td>
    # <td><%= link_to("Delete", profile_delete_entry_path(journal_entry.id)) %></td>
  # </tr>
  # <% end %>
# </table>

# <td><%= link_to("Show", journal_entry_path(:id => journal_entry.id)) %></td>
# <td><%= link_to("Delete", delete_journal_entry_path(:id => journal_entry.id)) %></td>

# <table>
  # <tr>
    # <th>Username</th>
    # <th>Created On</th>
    # <th>Entry</th>
  # </tr>
  # <% @journal_entries.each do |journal_entry| %>
  # <tr>
    # <td><%= journal_entry.user_identification_username %></td>
    # <td><%= journal_entry.entry_created_at %></td>
    # <td><%= journal_entry.entry %></td>
  # </tr>
  # <% end %>
# </table>
