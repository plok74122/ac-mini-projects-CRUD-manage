namespace :dev do
  task :fake_books => :environment do
    Book.delete_all
    bookcondition = BookCondition.all
    100.times do
      b = Book.create!(:name => Faker::Lorem.word, :description => Faker::Lorem.paragraph, :cost => rand(500), :book_condition => bookcondition.sample)
      puts "create #{b.id}"
    end
  end
end