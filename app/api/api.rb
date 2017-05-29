require 'grape'
require 'csv'
module API
  class Base < Grape::API
    version 'v1', using: :path, vendor: 'FootballApi'
    default_format :json


    helpers APIHelpers
    before do
      api_authenticate
      force_utf8_params
    end

    mount API::Users
    mount API::Seasons
    mount API::Players
    mount API::Matches

    add_swagger_documentation(
      base_path: "/api",
      api_version: 'v1',
      hide_documentation_path: true,
      endpoint_auth_wrapper: WineBouncer::OAuth2, # This is the middleware for securing the Swagger UI
      swagger_endpoint_guard: 'oauth2 false',     # this is the guard method and scope
      token_owner: 'resource_owner',
      models: [Entities::User, Entities::Error, Entities::ResponseData],
      markdown: GrapeSwagger::Markdown::KramdownAdapter
    )
  end
end