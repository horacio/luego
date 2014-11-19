class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
  end

  def create
    page = current_user.pages.build(page_params)
    if page.save
      page.parse!
      message = 'Page has been created.'
    else
      message = %{
        The URL is invalid and cannot be saved.
        Please use a valid URL beginning with http:// or https://
      }
    end

    redirect_to dashboard_path, notice: message
  end

  def archive
    page.archive
    redirect_to dashboard_path, notice: 'Page has been archived.'
  end

  def restore
    page.restore
    redirect_to dashboard_path, notice: 'Page has been restored.'
  end

  def destroy
    page.destroy
    redirect_to dashboard_path, notice: 'Page has been deleted.'
  end

  private

  def page
    @_page ||= Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:url)
  end
end
