class WelcomeController < ApplicationController
  def index
    search_with_params(params)
  end

  def import
    if params[:file].present? && params[:file].content_type == "text/csv"
      Database.import(params[:file])
      flash[:notice] = "CSV import sucсessfully"
      redirect_to root_path
    else
      flash[:error] = "Some problem with import CSV, please try again."
      redirect_to root_path
    end
  end

  private

  def search_with_params(params)
    @information = Database.all
    @information = @information.by_name(params[:name]) if params[:name].present?
    @information = @information.by_date(params[:date]) if params[:date].present?
    @information = @information.by_number(params[:number]) if params[:number].present?
    @information = @information.by_description(params[:description]) if params[:description].present?
  end

end
