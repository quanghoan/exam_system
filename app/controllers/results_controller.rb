class ResultsController < ApplicationController

  def create
    
    single_check_id = params[:test][:answers_attributes][:correct_answer]
    multiple_check_id = params[:test][:answers_attributes][:answer_id]
    single_array1 = single_check_id.map {|key,val| val} unless single_check_id.nil?
    array_id1 = single_array1.map(&:to_i) unless single_array1.nil?
    checked = multiple_check_id.select {|key,val| val =="1"} unless multiple_check_id.nil?
    string_array2 = checked.map {|key,val| key} 
    array_id2 = string_array2.map(&:to_i) unless string_array2.nil? 
    answer_ids = single_array1 + array_id2
    if !answer_ids.empty?
      for answer_id in answer_ids do 
        result = Result.create(user_id: current_user.id, answer_id: answer_id)
      	flash[:success] = " Test submitted." 
      end     
    end  
    @score1 = 0
    answers = Answer.find(answer_ids) 
    questions = []
    answers.each do |answer| 
      questions << answer.question unless questions.include?(answer.question)
      @score1 += 1 if answer.single && answer.correct_answer
    end 

    questions.each do |question|  
      answers.each do |answer| 
        if answer.correct_answer 
          # loai bo tat ca wrong answers
          true_answers = answers.reject {|answer| question.answers unless answer.correct_answer} 
          true_questions = questions.reject {|question| question unless answer.correct_answer}          
        end
        
        if !true_answers.nil?
          array_ans = true_answers.group_by {|an| an.question_id } 
          array_an = array_ans.map {|key,val| val}
          @score2 = 0
          true_answers.each do |ans|
            array_an.each do |an|
              if ans.multiple
                @score2 += 0.5 if ans.question.answers.where(correct_answer: true) == an
              end
            end  
          end 
        end 
        @score = @score1 + @score2  
      end
    end
    array_short = params[:test][:answers_attributes][:content]
    @array_contents = array_short.map {|id,content| content }
  end

  # private

  # def result_params
  # 	params.require(:test).permit(:user_id, :answer_id, :question_id)
  # end
end
