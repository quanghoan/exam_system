require 'csv'
namespace :csv do

  desc "Import CSV Data "

  task :exam => :environment do
    Rake::Task["db:migrate:reset"].invoke
    Rake::Task["db:seed"].invoke

    # subject_csv_file_path = 'db/data/thunghiem.csv'
    # CSV.foreach(subject_csv_file_path, headers: true, force_quotes: true, col_sep: ';') do |column|
    #   Subject.create!({
    #     id: column[0],
    #     title: column[1],
    #     duration: column[2]
    #   })
    #   puts "Subjects created!"

    #   Question.create!({
    #     subject_id: column[0],
    #     content: column[3],
    #     question_type: column[4],
    #     answers_attributes: [
    #       content: column[5],
    #       correct_answer: column[6]
    #     ] 
    #   })
    # end
    # puts "Subjects created!"
    subject_csv_file_path = 'db/data/subject.csv'
    CSV.foreach(subject_csv_file_path, force_quotes: true, col_sep: ';') do |column|
      Subject.create!({
        id: column[0],
        title: column[1],
        duration: column[2]  
      }) 
    end
    puts "Subjects created!"

    question_csv_file_path = 'db/data/question.csv'
    CSV.foreach(question_csv_file_path, force_quotes: true, col_sep: ';') do |column|
      Question.new({
        subject_id: column[0],
        question_type: column[1],
        content: column[2] 
      }).save(validate: false)
    end
    puts "Questions created!"

    answer_csv_file_path = 'db/data/answer.csv'
    CSV.foreach(answer_csv_file_path, force_quotes: true, col_sep: ';') do |column|
      Answer.create!({
        question_id: column[0],
        content: column[1],
        correct_answer: column[2]
      })
    end
    puts "Answers created!"
  end
end