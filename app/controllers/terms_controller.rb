class TermsController < ApplicationController
  def index
    @terms = Term.all #TODO: Get only the last 10 terms
    @term = Term.new
  end

  def create
    @term = Category.new(term_params)

    if @term.save
      redirect_back fallback_location: 'terms'
    end
  end

  private

  def term_params
    params.require(:term).permit(:term_text, :term_category)
  end
end
