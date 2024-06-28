# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_user_reports, only: %i(edit update delete)

  def index
    @reports = Report.order(:id)
  end

  def show
    @report = Report.find(params[:id])
    @comment = Comment.new
    @comments = @report.comments
  end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = current_user.reports.new(report_params)

    if @report.save
      redirect_to report_url(@report), notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @report.update(report_params)
      redirect_to report_url(@report), notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy

    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_user_reports
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
