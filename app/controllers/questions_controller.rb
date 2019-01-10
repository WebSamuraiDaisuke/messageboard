class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def edit
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(param_question)
    if @question.save #saveの前に、validateが走り、エラーだと@questionに情報が入れられる
    else
      flash[:error] = @question.errors.full_messages
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def param_question
    params.require(:question).permit(:title, :content)
  end
end
