class ResultsController < ApplicationController

  def create
    @results = []
    single_check_id = params[:test][:answers_attributes][:correct_answer]
    multiple_check_id = params[:test][:answers_attributes][:answer_id]
    string_array = single_check_id.map {|key,val| val} unless single_check_id.nil?
    checked = multiple_check_id.select {|key,val| val =="1"} unless multiple_check_id.nil?
    string_array = checked.map {|key,val| key} 
    answer_ids = string_array.map(&:to_i) unless string_array.nil? 
    if !answer_ids.empty?
      for answer_id in answer_ids do 
        result = Result.create(user_id: current_user.id, answer_id: answer_id)
      	flash[:success] = " Test submitted." 
        @results << result
      end     
    end  
    @results #return results of sumitted answers

    answers = Answer.find(answer_ids) 
    questions = []
    answers.each do |answer| 
      questions << answer.question unless questions.include?(answer.question) 
    end 
    questions # all questions of correct-submitted answers

    questions.each do |question|  
      answers.each do |answer| 
        if answer.correct_answer 
          # loai bo tat ca wrong answer, bao gom ca correct answer ma co question chua wrong answer  
          true_answers = answers.reject {|answer| question.answers unless answer.correct_answer} 
          true_questions = questions.reject {|question| question unless answer.correct_answer}
          byebug
        end
      end   
    end
    
    if !true_answers.empty?
      count = 0
      true_questions.each do |question|
        true_answers.each do |answer|
          if answer.single
            count += 1
          elsif answer.multiple
            if aswer.question
          end  
        end
      end  
    end
  end

  private

  def result_params
  	params.require(:test).permit(:user_id, :answer_id, :question_id)
  end
end
