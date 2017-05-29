module API
  class Players < Grape::API
    namespace :players do
      desc 'Get list Player',
        entity: Entities::Player,
        headers: {
          "UserToken" => {
            description: "User's authentication_token",
            type: String,
            required: true
          }
        }
      params do
        optional :search_text, type: String, desc: "Name of players for filter"
        optional :page, type: Integer, desc: 'The page number (Pagination)'
      end
      get "/search" do
        authenticate_user
        players = Player.search params
        response_success_pagination I18n.t("success.get_list_players"), Entities::Player.represent(players), players
      end
    end
  end
end