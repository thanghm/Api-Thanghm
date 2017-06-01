module API
  class Matches < Grape::API
    namespace :matches do
      desc 'Get list Matches',
        entity: Entities::Match,
        headers: {
          "UserToken" => {
            description: "User's authentication_token",
            type: String,
            required: true
          }
        }
      params do
        optional :season_name, type: String, desc: "Name of Seasons for filter"
        optional :player_name, type: String, desc: "Name of Player for filter"
        optional :page, type: Integer, desc: 'The page number (Pagination)'
      end
      get "seach_matches" do
        authenticate_user
        matchs = Match.matchs_search params
        response_success_pagination I18n.t("success.get_list_matches"), Entities::Match.represent(matchs), matchs
      end
    end
  end
end