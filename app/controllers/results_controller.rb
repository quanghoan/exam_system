class ResultsController < ApplicationController

  def create
    flash[:success] = " Test submitted."
    single_check_id = params[:test][:answers_attributes][:correct_answer]
    multiple_check_id = params[:test][:answers_attributes][:answer_id]
    single_array1 = single_check_id.map {|key,val| val} unless single_check_id.nil?
    array_id1 = single_array1.map(&:to_i) unless single_array1.nil?
    checked = multiple_check_id.select {|key,val| val =="1"} 
    string_array2 = checked.map {|key,val| key}
    array_id2 = string_array2.map(&:to_i) 
  	        
    @score1 = 0
    single_answers = Answer.find(array_id1) unless array_id1.nil?
    if !single_answers.nil?
      single_answers.each do |answer|
        @score1 +=1 if answer.correct_answer
      end  
    end

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
      array_an.each do |an|
        @score2 += 1 if ans == an
      end 
    end  
    @score = @score1 + @score2  

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
    subject_id = params[:test][:subject_id].to_i
    Grade.create(user_id: current_user.id, score: @score, short_question: @hash, subject_id: subject_id) 
  end
end
