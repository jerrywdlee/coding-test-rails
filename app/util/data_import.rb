require "csv"

module DataImport
  class << self
    def load_titanic_csv(path)
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

    # DataImport.load_sales_data_csv
    def load_sales_data_csv(dir_path = "vendor/sample_csv")
      ActiveRecord::Base.transaction do
        import_from_csv_table(
          CSV.table(File.join(dir_path, "customers.csv")),
          Customer
        )
        import_from_csv_table(
          CSV.table(File.join(dir_path, "addresses.csv")),
          Address
        )
        import_from_csv_table(
          CSV.table(File.join(dir_path, "items.csv")),
          Item
        )
        import_from_csv_table(
          CSV.table(File.join(dir_path, "reviews.csv")),
          Review
        )
      end
    end

    def import_from_csv_table(csv_table, model)
      columns = model.columns.map(&:name).map(&:to_sym)
      model.import(csv_table.map do |row|
        params = row.to_hash.keep_if {|key, _| columns.include?(key)}
        object = model.find_by(params)
        object ? nil : model.new(params)
      end.compact)
    end
  end
end
