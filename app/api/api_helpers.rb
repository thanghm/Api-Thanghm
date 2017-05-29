module APIHelpers
	def api_authenticate
    error!(response_error(I18n.t("error.invalid_api_key"), I18n.t("error_code.invalid_api_key")), 403) unless ApiKey.find_by_access_token(headers['Apikey']).present?
  end

  def current_user
    @current_user ||= User.where(authentication_token: headers['Usertoken']).first
  end

  def authenticated
    if headers['Usertoken'] && User.where(authentication_token: headers['Usertoken']).first
      return true
    else
      error!(response_error(I18n.t("error.unauthorized"), I18n.t("error_code.unauthorized")), 200)
    end
  end

  def authenticate_user
    authenticated
  end

	def force_utf8_params
    traverse = lambda do |object, block|
      if object.kind_of?(Hash)
        object.each_value { |o| traverse.call(o, block) }
      elsif object.kind_of?(Array)
        object.each { |o| traverse.call(o, block) }
      else
        block.call(object)
      end
      object
    end
    force_encoding = lambda do |o|
      o.force_encoding(Encoding::UTF_8) if o.respond_to?(:force_encoding)
    end
    traverse.call(params, force_encoding)
  end

	def response_success_pagination(message = '', data = {}, pagination)
    {success: true, message: message, data: data, total: pagination.total_count, total_pages: pagination.total_pages, next_page: pagination.next_page}
  end

  def response_success(message = '', data = {}, actions = [])
    {success: true, message: message, data: data, actions: actions}
  end

  def response_error(message = '', error = 000)
    {success: false, message: message, error: error}
  end
end