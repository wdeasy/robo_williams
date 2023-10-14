Sequel.migration do
  change do
    puts "Creating Tables..."

    create_table(:shoutouts) do
      primary_key :id
      String :name, null: false
      Date :day, null: false
      String :discord
    end

    create_table(:messages) do
      primary_key :id
      String :regex, null: false
      String :text
      String :file
      String :emoji
    end
  end
end
