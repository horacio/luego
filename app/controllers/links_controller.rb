class LinksController < ApplicationController
  def show
  end

  def create
    link = current_user.links.build(link_params)
    link.save
    redirect_to dashboard_path
  end

  def archive
    link.archive
    redirect_to dashboard_path, notice: 'Link has been archived.'
  end

  def restore
    link.restore
    redirect_to dashboard_path, notice: 'Link has been restored.'
  end

  def destroy
    link.destroy
    redirect_to dashboard_path, notice: 'Link has been deleted.'
  end

  private

  def link
    @_link ||= Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:url)
  end
end
