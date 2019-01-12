class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :show, :update, :destroy]
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(param_question)
    if @question.save # saveの前に、validateが走り、エラーだと@questionに情報が入れられる
      redirect_to root_path, notice: 'Succeed'
    else
      flash[:error] = @question.errors.full_messages
      render :new
    end
  end

  def show
    @answer = Answer.new
  end

  def edit
  end

  def update
    if @question.update(param_question)
      flash[:succeed] = 'Update is succeed'
      redirect_to root_path
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path, notice: 'Delete is Success'
  end

  private

  def param_question
    params.require(:question).permit(:title, :content)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
