class ExamplesController < ApplicationController

  def index
    @examples = Example.order(created_at: :desc)
  end

  def new
    @example = Example.new
  end

  def create
    @example = Example.new(term_params)

    if @example.save
      flash[:notice] = "Example was saved!"
      redirect_back fallback_location: 'terms'
    else
      flash[:notice] = "Something was wrong with your example"
      redirect_to root_path
    end
  end

  def destroy
    @example = Example.find(params[:id])
    @example.destroy

    redirect_to terms_path
  end

  private

  def term_params
    params.require(:example).permit(:sentence, :term_id)
  end
end
