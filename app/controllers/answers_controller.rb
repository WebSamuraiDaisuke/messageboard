class AnswersController < ApplicationController
  before_action :set_question
  def create
    @answer = Answer.new
    if @answer.update(params_answer)
      redirect_to question_path(@question), notice: 'Success'
    else
      redirect_to question_path(@question), alert: 'failed'
    end
  end

  def edit
    @answer = @question.answers.find(params[:id])
  end

  def update
    @answer = @question.answers.find(params[:id])
    if @answer.update(params_answer)
      redirect_to question_path(@question), notice: 'Success'
    else
      flash[:alert] = 'Invalid!'
      render :edit
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question, notice: 'Deleted')
  end

  private

  def params_answer
    params.require(:answer).permit(:question_id, :name, :content)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
