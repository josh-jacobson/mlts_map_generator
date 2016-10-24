require 'rake'
namespace :import do
  desc 'Import screenings from Google Sheet'
  task :screenings => :environment do
    xlsx = Roo::Spreadsheet.open('xlsx/screenings-10-24-16.xlsx')
    xlsx = Roo::Excelx.new("xlsx/screenings-10-24-16.xlsx")
    sheet = xlsx.sheet(0)

    data = sheet.parse(address: 'address', date_and_time: 'Time and Date of First Screening', organization_name: 'organization_name')
    puts data

    Screening.create(data)
  end
end


require 'roo'

