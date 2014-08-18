class ArchivesController < ApplicationController
  def show
    @archive = Archive.new(current_user)
  end
end
