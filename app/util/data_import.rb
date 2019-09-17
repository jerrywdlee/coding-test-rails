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
      puts "#{passengers.size} passengers inserted!"
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
        import_from_csv_table(
          CSV.table(File.join(dir_path, "purchases.csv")),
          Purchase
        )
        import_from_csv_table(
          CSV.table(File.join(dir_path, "tags.csv")),
          Tag
        )

        items_tags = CSV.table(File.join(dir_path, "items_tags.csv"))
        sql = "INSERT INTO items_tags (#{items_tags.headers.join(',')}) VALUES "
        sql += items_tags.map do |row|
          "(#{row.to_hash.values.join(',')})"
        end.join(',')
        con = ActiveRecord::Base.connection
        con.execute("DELETE FROM items_tags")
        con.execute(sql)

        puts "Sales Data imported!"
      end
    end

    def import_from_csv_table(csv_table, model, log_flg = true)
      columns = model.columns.map(&:name).map(&:to_sym)
      objects = csv_table.map do |row|
        params = row.to_hash.keep_if {|key, _| columns.include?(key)}
        object = model.find_by(params)
        object ? nil : model.new(params)
      end.compact
      model.import(objects)
      if log_flg
        class_name = model.new.class.name.pluralize
        puts "#{objects.size} #{class_name} inserted!"
      end
    end
  end
end
