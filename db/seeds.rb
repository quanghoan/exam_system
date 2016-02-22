User.create!(name:  "admin1",
             email: "quanghoan@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)

User.create!(name:  "user1",
             email: "hoan1@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             address: "hanoi",
             phone: '0102033')
# Subject.create!(
#   title: "Internship",
#   duration: 20)
# Subject.create!(
#   title: "Java Basic",
#   duration: 10)
# Subject.create!(
#   title: "PHP Basic",
#   duration: 30)
# Question.create!(
#   subject_id: 1,
#   content: "", 
#   question_type: 1,
#   answers_attributes: )
