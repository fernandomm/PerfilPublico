# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# unless Candidate.exists?
#   ActiveRecord::Base.transaction do
#     psdb = PoliticalParty.create(name: 'PSDB',
#       image: File.new('./spec/fixures/psdb.png'))
#     pt = PoliticalParty.create(name: 'PT',
#       image: File.new('./spec/fixures/pt.jpg'))
#     psdb.candidates.create(name: 'Aécio Neves', age: 54, biography: """
#       Aécio Neves da Cunha is a Brazilian economist, politician and president
#       of the Brazilian Social Democracy Party.
#       """, image: File.new('./spec/fixures/aecio.jpg'),
#       political_office: 'president')
#
#     pt.candidates.create(name: 'Dilma Rousseff', age: 66, biography: """
#       Dilma Vana Rousseff is the 36th and current President of Brazil. She is
#       the first woman to hold the office. She was previously the Chief of Staff
#       of the President Luiz Inácio Lula da Silva from 2005 to 2010.
#       """, image: File.new('./spec/fixures/dilma.jpg'),
#       political_office: 'president')
#   end
# end

def random_state
  ["ac",
  "al",
  "ap",
  "am",
  "ba",
  "ce",
  "df",
  "es",
  "go",
  "ma",
  "mt",
  "ms",
  "mg",
  "pa",
  "pb",
  "pr",
  "pe",
  "pi",
  "rj",
  "rn",
  "rs",
  "ro",
  "rr",
  "sc",
  "sp",
  "se",
  "to"].to_a.sample
end

ActiveRecord::Base.transaction do
  puts "Seeding Candidates and its Political Parties..."
  # Seeds for the competition
  PoliticalParty.create(name: 'House Targaryen').candidates
    .create(name: 'Daenerys Targaryen', age: 18, biography: """
      Daenerys of the House Targaryen, the First of Her Name;
      Queen of Meereen;
      Queen of the Andals, the Rhoynar and the First Men;
      Lady Regnant of the Seven Kingdoms;
      Protector of the Realm;
      Khaleesi of the Great Grass Sea;
      Breaker of Chains;
      Mother of Dragons.
      """, image: File.new('./spec/fixures/daenerys.jpg'),
      political_office: 'president', state: random_state)

  baratheonn = PoliticalParty.create(name: 'House Baratheonn')
  baratheonn.candidates.create(name: 'Joffrey Baratheonn', age: 19, biography: """
      King Joffrey of House Baratheon, the First of His Name.
      The King on the Iron Throne.
      """, image: File.new('./spec/fixures/joffrey.jpg'),
      political_office: 'president' )
  baratheonn.candidates.create(name: 'Tommen Baratheon', age: 12,
      biography: "Tommen of the House Baratheon the First of His Name",
      image: File.new('./spec/fixures/tommen.jpg'),
      political_office: 'city_councilman', state: random_state)

  lannister = PoliticalParty.create(name: 'House Lannister')
  lannister.candidates.create(name: 'Tyrion Lannister', age: 36, biography: """
      Intelligent, witty and well-read, and shares his father's skill for business
      and political maneuvering.
      """, image: File.new('./spec/fixures/tyrion.jpg'),
      political_office: 'senator', state: random_state)
  lannister.candidates.create(name: 'Cersei Lannister', age: 40, biography: """
      Queen Regent; Lady Paramount of the Westerlands; Lady of Casterly Rock.
      """, image: File.new('./spec/fixures/cercei.png'),
      political_office: 'senator', state: random_state)


  PoliticalParty.create(name: 'House Tyrell').candidates
    .create(name: 'Olenna Tyrell', age: 90, biography: "The Queen of Thorns.",
      image: File.new('./spec/fixures/olenna.jpg'),
      political_office: 'congressman', state: random_state)

  stark = PoliticalParty.create(name: 'House Stark');
  stark.candidates.create(name: 'Jon Snow', age: 20,
      biography: "Lord Snow, The Bastard of Winterfell.",
      image: File.new('./spec/fixures/jon-snow.jpeg'),
      political_office: 'congressman', state: random_state)
  stark.candidates.create(name: 'Catelyn Tully', age: 35,
      biography: "Catelyn Tully, or Catelyn Stark, is the wife of Lord Eddard Stark and Lady of Winterfell.",
      image: File.new('./spec/fixures/catelyn.jpg'),
      political_office: 'state_representative', state: random_state)

  PoliticalParty.create(name: 'House Greyjoy').candidates
    .create(name: 'Theon Greyjoy', age: 25,
      biography: "Prince of Winterfell; Captain of Sea Bitch; Lord of the Iron Islands",
      image: File.new('./spec/fixures/theon.jpg'),
      political_office: 'city_councilman', state: random_state)

  PoliticalParty.create(name: 'House Tarth').candidates
    .create(name: 'Brienne of Tarth', age: 30,
      biography: "The Maid of Tarth; Brienne the Beauty.",
      image: File.new('./spec/fixures/brienne.jpg'),
      political_office: 'state_representative', state: random_state)
end

ActiveRecord::Base.transaction do
  puts "Seeding Categories..."
  %w(roads safety health castles).each do |category|
    Category.create(name: category)
  end
end

puts "Seeding promises..."
Candidate.all.each do |candidate|
  ActiveRecord::Base.transaction do
    puts "Seeding promises for #{candidate.name}..."
    7.times do |x|
      text = []
      url = URI.parse("http://www.gameofipsum.com")
      res = Net::HTTP.start(url.host, url.port) do |http|
        http.get("/api/?type=json&paragraphs=1")
      end
      text = JSON.parse res.body
      promise = candidate.promises.new(title: "#{text[0][0..15]}...",
        description: text[0], category: Category.order("RANDOM()").first,
        visible: true, date: (1..500).to_a.sample.days.ago,
        up_votes: (1..500).to_a.sample, down_votes: (1..500).to_a.sample,
        visualization_count: (1..500).to_a.sample,
        status: ['accomplished', 'in_progress', 'not_accomplished'][(0..2).to_a.sample])
      begin
        promise.save!
      rescue Exception => e
        puts e.inspect
      end
    end
  end
end
