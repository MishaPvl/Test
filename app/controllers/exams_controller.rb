class ExamsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @search = Exam.ransack(params[:q])
    @exams = @search.result(distinct: true).paginate(page: params[:page], per_page: 15)
    @exams_count = Exam.count
  end

  def show; end

  def new
    @exam = Exam.new
  end

  def edit; end

  def create
    @exam = Exam.new(exam_params)
    if @exam.valid?
      @exam.save
      redirect_to @exam, notice: 'Экзамен успешно добавлен'
    else
      render :new
    end
  end

  def update
    if @exam.update(exam_params)
      redirect_to @exam, notice: 'Экзамен успешно обновлён'
    else
      render :edit
    end
  end

  def destroy
    @exam.destroy
    redirect_to exams_path, notice: 'Запись успешно удалена'
  end

  private

  def set_student
    @exam = Exam.find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:first_name, :middle_name, :last_name, :subject, :date)
  end
end
