require 'csv'

namespace :csv do

  desc "Import CSV Data "

  task :exam => :environment do
    Rake::Task["db:migrate:reset"].invoke
    Rake::Task["db:seed"].invoke

    subject_csv_file_path = 'db/subject.csv'
    CSV.foreach(subject_csv_file_path) do |column|
      Subject.create!({
        id: column[0],
        title: column[1],
        duration: column[2]  
      }) 
    end
    puts "Subjects created!"

    question_csv_file_path = 'db/question.csv'
    CSV.foreach(question_csv_file_path, force_quotes: true, col_sep: ';', skip_blanks: true) do |column|
      Question.create!({
        subject_id: column[0],
        question_type: column[1],
        content: column[2]
      })
    end
    puts "Questions created!"

    answer_csv_file_path = 'db/answer.csv'
    CSV.foreach(answer_csv_file_path) do |column|
      Answer.create!({
        question_id: column[0],
        content: column[1],
        correct_answer: column[2]
      })
    end
    puts "Answers created!"
  end
end