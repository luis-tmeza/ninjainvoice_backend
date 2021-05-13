class ApplicationController < ActionController::API
  before_action :underscore_params!

  def underscore_params!
    params.deep_transform_keys!(&:underscore)
  end
end
