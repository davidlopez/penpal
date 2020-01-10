class Journal
  attr_reader :entry
  
  def initialize(data,user)
    @entry = user.journal_entries.new
  end
end
