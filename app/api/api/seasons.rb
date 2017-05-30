module API
  class Seasons < Grape::API
    # not_admins = lambda { |token_owner = nil| token_owner.nil? || !token_owner.admin? }
    namespace :seasons do
      desc 'Upload file CSV.', 
        entity: Entities::Season,
        headers: {
          "UserToken" => {
            description: "User's authentication_token",
            type: String,
            required: true
          }
        }
      params do
        optional :csv, type: Array do
          requires :file, :type => Rack::Multipart::UploadedFile, :desc => "import file csv."
        end
      end
      post "/csv" do
        authenticate_user
        player_1 = []
        player_2 = []
        group = []
        match_code = []
        time = []
        date = []
        venue = []
        score = []
        name = ''
        season = []
        is_new = false
        inputPath = params.csv[0].file.to_hash
        inputPath.map do |key, value|
          if key == "filename"
            name = value.to_s.gsub('.csv','')
            season = Season.find_by(name: name)
          end
          if season.blank? && key == "tempfile"
            is_new = true
            Season.create_from_csv name
            CSV.foreach(value).with_index do |row,index|
              if index != 0 && row[1].present? && row[2].present? && row[3].present? && row[4].present? && row[5].present? && row[6].present? && row[7].present?  && row[8].present?
                player_1[index] = row[3]
                player_2[index] = row[4]
                group[index] = row[1]
                match_code[index] = row[2]
                time[index] = row[5]
                date[index] = row[6]
                venue[index] = row[7]
                score[index] = row[8]
                Player.import_csv(name, player_1[index], player_2[index], group[index], match_code[index], time[index], date[index], venue[index], score[index])
              end
            end
          end
        end
        if is_new
          response_success I18n.t("success.create_season")
        else
          response_error I18n.t("error_code.create_other")
        end
      end
    end
  end
end
