require 'csv'

CSV.foreach("db/mountain-list.csv", headers: true) do |row|
  Mountain.create(
    kana: row[0],
    mountain_name: row['山名<山頂名>'],
    prefecture: row['都道府県'],
    elevation: row['標高'],
    latitude: row['緯度'],
    longitude: row['経度'],
  )
end