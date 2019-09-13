require "csv"

module DataImport
  class << self
    def load_csv(path)
      table = CSV.table(path)
      columns = Passenger.columns.map(&:name).map(&:to_sym)
      passengers = []
      table.each do |row|
        params = row.to_hash.keep_if {|key, _| columns.include?(key)}
        passenger = Passenger.find_by(params)
        unless passenger
          passenger = Passenger.new(params)
          passengers << passenger
        end
      end
      ActiveRecord::Base.transaction do
        Passenger.import passengers
      end
      puts "#{passengers.size} passengers inseted!"
    end
  end
end
