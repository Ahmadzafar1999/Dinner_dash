# frozen_string_literal: true

# This is the home page and index is the root path for this application
class HomeController < ApplicationController
  def index
    redirect_to products_path if user_signed_in?
  end
end
