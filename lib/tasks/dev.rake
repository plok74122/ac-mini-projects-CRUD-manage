namespace :dev do
  task :fake_books => :environment do
    Book.delete_all
    bookcondition = BookCondition.all
    100.times do
      b = Book.create!(:name => Faker::Lorem.word,
                       :description => Faker::Lorem.paragraph,
                       :cost => rand(500),
                       :book_condition => bookcondition.sample,
                       :buy_time => Faker::Time.between(15.days.ago, Date.today, :all),
                       :publish_date=>Faker::Date.between(2.years.ago, 20.days.ago))
      puts "create #{b.id}"
    end
  end
end