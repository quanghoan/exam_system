class ResultsController < ApplicationController

  def create
    
    if (params[:test][:answers_attributes]).nil?
      flash[:danger] = " No answer found."
    else    
      flash[:success] = " Test submitted."
      single_check_id = params[:test][:answers_attributes][:correct_answer]      
      single_array1 = single_check_id.map {|key,val| val} unless single_check_id.nil?
      array_id1 = single_array1.map(&:to_i) unless single_array1.nil?
             
      @score1 = 0
      single_answers = Answer.find(array_id1) unless array_id1.nil?
      if !single_answers.nil?
        single_answers.each do |answer|
          @score1 +=1 if answer.correct_answer
        end  
      end 
      
      if !params[:test][:answers_attributes][:answer_id].nil?
        multiple_check_id = params[:test][:answers_attributes][:answer_id]
        checked = multiple_check_id.select {|key,val| val =="1"} 
        string_array2 = checked.map {|key,val| key}
        array_id2 = string_array2.map(&:to_i) 
        multi_answers = Answer.find(array_id2)   
        true_answers = []
        multi_answers.each do |answer|
          true_answers << answer if answer.correct_answer
        end         
        multis = multi_answers.group_by {|multi| multi.question_id}
        array_multis = multis.map {|key, val| val} 
        array_ans = true_answers.group_by {|an| an.question_id } 
        array_an = array_ans.map {|key,val| val} 
        @score2 = 0
        array_multis.each do |ans|
          true_answers.each do |an|
            @score2 += 0.5 if ans == an.question.answers.where(correct_answer: true)
          end 
        end 
        @score = @score1 + @score2 
      else 
        @score = @score1  
      end
      subject_id = params[:test][:subject_id].to_i
      if !params[:test][:answers_attributes][:content].nil?
        array_short = params[:test][:answers_attributes][:content]
        contents = array_short.map {|id, content| content}
        short_questions = array_short.map {|id,content| id}
        short_question_ids = short_questions.map(&:to_i)
        short_ques = Question.find(short_question_ids) 
        short_content = []
        short_ques.each do |ques|
          short_content << ques.content
        end
        @hash = Hash[short_content.zip(contents)] 
      else
        @hash = nil
      end
      Grade.create(user_id: current_user.id, score: @score, short_question: @hash, subject_id: subject_id) 
    end
  end
end