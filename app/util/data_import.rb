require "csv"

module DataImport
  class << self
    def load_csv(path)
      table = CSV.table(path)
      columns = Passenger.columns.map(&:name).map(&:to_sym)
      ActiveRecord::Base.transaction do
        table.each do |row|
          params = row.to_hash.keep_if {|key, _| columns.include?(key)}
          passenger = Passenger.find_or_create_by(params)
        end
      end
    end
  end
end
