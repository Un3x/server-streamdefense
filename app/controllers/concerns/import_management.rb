# frozen_string_literal: true

module ImportManagement
  extend ActiveSupport::Concern

  included do
    before_action :check_import_file, only: :import
  end

  def import
    raise 'Method not implemented'
  end

  private

  def check_import_file
    return redirect_to request.referer, notice: 'No file selected' if params[:file].nil?

    redirect_to request.referer, notice: 'Invalid file type' unless params[:file].content_type == 'text/csv'
  end
end
