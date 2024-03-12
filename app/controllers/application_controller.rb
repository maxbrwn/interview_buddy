class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action -> { sleep 3 }
end
