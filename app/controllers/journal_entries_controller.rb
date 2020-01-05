class JournalEntriesController < ApplicationController
  def create
    resource_facade.new_entry.update(journal_params)
    if resource_facade.new_entry.save
      redirect_to '/boost?completed=true'
    end
  end

  private

    def journal_params
      params.require(:journal_entry).permit(:entry)
    end
end
