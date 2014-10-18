# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

unless Candidate.exists?
  ActiveRecord::Base.transaction do
    psdb = PoliticalParty.create(name: 'PSDB',
      image: File.new('./spec/fixures/psdb.png'))
    pt = PoliticalParty.create(name: 'PT',
      image: File.new('./spec/fixures/pt.jpg'))
    psdb.candidates.create(name: 'Aécio Neves', age: 54, biography: """
      Aécio Neves da Cunha is a Brazilian economist, politician and president
      of the Brazilian Social Democracy Party
      """, image: File.new('./spec/fixures/aecio.jpg'))

    pt.candidates.create(name: 'Dilma Rousseff', age: 66, biography: """
      Dilma Vana Rousseff is the 36th and current President of Brazil. She is
      the first woman to hold the office. She was previously the Chief of Staff
      of the President Luiz Inácio Lula da Silva from 2005 to 2010.
      """, image: File.new('./spec/fixures/dilma.jpg'))
  end
end
