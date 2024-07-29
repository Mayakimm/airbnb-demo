class PagesController < ApplicationController
  def home
    @flats = Flat.all
    if params[:query].present?
      sql_subquery = <<~SQL
        flats.name @@ :query
        OR flats.address @@ :query
      SQL
      @flats = @flats.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end
end
