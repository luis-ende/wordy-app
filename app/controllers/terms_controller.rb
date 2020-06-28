class TermsController < ApplicationController
  def index
    @terms = Term.order(created_at: :desc).first(20)
    @default_category_id = Category.get_default_category.id
    @term = Term.new
    @category_names = Category.get_names
  end

  def edit
    @term = Term.find(params[:id])
  end

  def create
    @term = Term.new(term_params)
    category = @term.category
    if not category
      category = get_default_category
      if category
        @term.category = category
      end
    end

    if @term.save
      redirect_back fallback_location: 'terms'
    end
  end

  def update
    @term = Term.find(params[:id])
    if @term.update(term_params)
      redirect_to terms_path
    end
  end

  def destroy
    @term = Term.find(params[:id])
    @term.destroy

    redirect_to terms_path
  end

  private

  def term_params
    params.require(:term).permit(:term_text, :category_id)
  end
end
