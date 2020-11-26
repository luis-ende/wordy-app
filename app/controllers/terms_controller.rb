class TermsController < ApplicationController
  def index
    @terms = Term.order(created_at: :desc).first(20)
    @category_names = Category.get_names
    @default_category_id = Category.get_default_category.id
    @term = Term.new
  end

  def edit
    @term = Term.find(params[:id])
    @example = Example.new
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

  def learning
    @learning_terms = Term.where(learning: true).order('learning_updated DESC')
  end

  def toggle_learning
    term = Term.find(params[:term_id])
    term.learning = !term.learning
    term.learning_updated = DateTime.now
    term.save

    redirect_back fallback_location: 'terms'
  end

  def update_tags
    term = Term.find(params[:term_id])
    term.update(tag_names: params[:tag_names])
  end

  def explore
    @terms = Term.order(created_at: :desc).first(20)
    @category_names = Category.get_names
  end

  def search
    
  end

  private

  def term_params
    params.require(:term).permit(:term_text, :category_id, :translation)
  end
end
