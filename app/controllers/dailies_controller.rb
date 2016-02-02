class DailiesController < ApplicationController
	def listachamada
		@grade=params[:grade]
		@discipline=params[:discipline]
	end
	def finalizachamada
		params[:dailies]['student_id'].each_with_index do |x,i|
			@daily = Daily.new
			@daily[:student_id]=params[:dailies]['student_id'][i]
			@daily[:grade_id]=params[:dailies]['grade_id'][i]
			@daily[:discipline_id]=params[:dailies]['discipline_id'][i]
			@daily[:status]=params[:dailies]['status'][i]
			@daily.save
		end
		if @daily
			redirect_to controller: 'homes', action: 'index'
			flash[:message]="Chamada realizada."
			flash[:type] = "alert alert-success"
		else
			redirect_to controller: 'homes', action: 'index'
			flash[:message]="Erro ao realizar chamada."
			flash[:type] = "alert alert-danger"
		end
	end
end
