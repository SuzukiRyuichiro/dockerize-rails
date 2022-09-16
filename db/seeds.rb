10.times do
  attr = {
    title: Faker::Tea.unique.variety,
    description: Faker::Movies::BackToTheFuture.unique.quote
  }
  Task.create(attr)
end
