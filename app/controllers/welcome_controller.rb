class WelcomeController < ApplicationController
  def index
    @last_terms = Term.order(created_at: :desc).first(7)
  end
end
