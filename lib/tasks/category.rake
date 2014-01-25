namespace :category do

  desc "Generate Default Categories"
  task :generate_default => :environment do
    ["Funny Animals", "Technology", "Sports", "Entertainment", "Travel", 
      "Photography","Food", "Cars", "Programming", "Design", "Investing", 
      "Real Estate"].each do |category_name|
        Category.create(name: category_name)
      end
  end
end
