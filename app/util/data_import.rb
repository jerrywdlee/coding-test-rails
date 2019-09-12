require "csv"

module DataImport
  class << self
    def load_csv(path)
      table = CSV.table(path)
      columns = Passenger.columns.map(&:name).map(&:to_sym)
      passengers = []
      table.each do |row|
        params = row.to_hash.keep_if {|key, _| columns.include?(key)}
        passengers << Passenger.find_or_initialize_by(params)
      end
      ActiveRecord::Base.transaction do
        Passenger.import passengers
      end
    end
  end
end
