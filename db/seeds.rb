puts 'Remove old data'

User.delete_all
Maker.delete_all
Product.delete_all
Review.delete_all
Comment.delete_all

puts 'Generate new data'
PEXEL_BANNER_PHOTOS = ["000000", "99999", "188035", "236709", "239898", "247763", "256219", "256381", "257856",
  "270695", "273244", "273254", "301930", "325229", "326410", "356040", "356830", "433154", "585419", "811107", "839934",
  "416408", "668296", "1011668", "371938", "207731", "942424", "265125", "301871", "441963", "724921", "1011666", "1011667",
  "358667", "389819", "417352", "256297", "236093", "373543", "1011665", "625279", "461146", "961250"]
USERS = 10
PRODUCTS = 20
REVIEWS = 50
MAKERS = 10
COMMENTS = 500

USERS.times do |_u_index|
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_digest: 'password',
    avatar: Faker::Avatar.image
  )
end

MAKERS.times do |_m_index|
  Maker.create(
    name: Faker::Name.name,
  )
end

PRODUCTS.times do |_p_index|
  Product.create(
    name: Faker::Name.name,
    category: Faker::Name.name,
    maker_id: Maker.pluck(:id).sample
  )
end

REVIEWS.times do |_r_index|
  Review.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    banner: "/images/banners/pexels-photo-" + PEXEL_BANNER_PHOTOS.sample + ".jpeg",
    state: Faker::Boolean.boolean,
    user_id: User.pluck(:id).sample,
    created_at: Faker::Date.between(1.month.ago, Date.today)
  )
end

COMMENTS.times do |_c_index|
  Comment.create(
    user_id: User.pluck(:id).sample,
    review_id: Review.pluck(:id).sample,
    content: Faker::Lorem.paragraph,
    star: rand(10)
  )
end
