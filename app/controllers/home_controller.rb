# frozen_string_literal: true

# This is the home page and index is the root path for this application
class HomeController < ApplicationController
  def index
    if user_signed_in?
      puts 'admin dashboard'
    else
      puts 'normal home page'
    end
  end
end
