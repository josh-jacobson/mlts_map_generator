require 'rake'
namespace :import do
  desc 'Import screenings from Google Sheet'
  task :screenings => :environment do
    xlsx = Roo::Spreadsheet.open('xlsx/nd_map_points.xlsx')
    xlsx = Roo::Excelx.new("xlsx/nd_map_points.xlsx")
    sheet = xlsx.sheet(0)

    data = sheet.parse(address: 'Address',  organization_name: 'Name')
    puts data

    Screening.create(data)
  end
end


require 'roo'

