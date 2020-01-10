class JournalEntriesController < ApplicationController

  def index
    @entries = current_user.journal_entries.all
  end
  def create
    new_entry = current_user.journal_entries.new
    new_entry.update(journal_params)
    if new_entry.save && params[:resource]
      redirect_to '/boost?journal=true'
    else
      redirect_to landing_path
      session.delete(:suggestion)
    end
  end

  private

    def journal_params
      params.require(:journal_entry).permit(:entry)
    end
end
