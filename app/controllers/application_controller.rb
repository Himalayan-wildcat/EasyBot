class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def pretty_json(obj, options = nil)
    render json: JSON.pretty_generate(obj.as_json(options))
  end

end
