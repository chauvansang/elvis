class PagesController < ApplicationController
  def home
    @token = params[:token] if params[:token]
  end
end
