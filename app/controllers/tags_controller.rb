class TagsController < ApplicationController
  def search
    if params[:tag].present?
      @tags = Gutentag::Tag.where('LOWER(name) LIKE LOWER(?)',
                                  "%#{params[:tag]}%");
      if @tags
        respond_to do |format|
          format.html { redirect_to search_tag_path }
          format.js { render partial: 'tags/result' }
        end
      else
        respond_to do |format|
          format.html { redirect_to search_tag_path }
          format.js { render partial: 'tags/result' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to search_tag_path }
      end
    end
  end
end
