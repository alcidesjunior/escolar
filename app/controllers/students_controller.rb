class StudentsController < ApplicationController
	def liststudents
		@students = Student.all
	end
	def newstudent
	end
	def new
		@student = Student.new
		params[:novoaluno].each do |param,value|
			@student[param]=value
		end
		if @student.save
			redirect_to controller: 'homes', action: 'index'
			flash[:message]="Aluno cadastrado."
			flash[:type] = "alert alert-success"
		else
			redirect_to controller: 'homes', action: 'index'
			flash[:message]="Erro ao cadastrar aluno."
			flash[:type] = "alert alert-danger"
		end
	end
	def editstudent
		@student = Student.find_by_id(params[:id])
	end
	def update
		@student = Student.find_by_id(params[:id])
		params[:novoaluno].each do |param,value|
			@student[param]=value
		end
		if @student.save
			redirect_to controller: 'homes', action: 'index'
			flash[:message]="Aluno atualizado."
			flash[:type] = "alert alert-success"
		else
			redirect_to controller: 'homes', action: 'index'
			flash[:message]="Erro ao atualizar aluno."
			flash[:type] = "alert alert-danger"
		end
	end
	def delete
		#caso exista um relacionamento entre TURMA-ALUNO
		if turmaaluno = Gradeestudent.find_by_student_id(params['id'])
			turmaaluno.delete
			if Student.delete(params[:id])
				flash[:message]="Aluno deletado."
				flash[:type] = "alert alert-success"
				redirect_to controller: 'homes', action: 'index'
				
			else
				flash[:message]="Erro ao excluir aluno."
				flash[:type] = "alert alert-danger"
				redirect_to controller: 'homes', action: 'index'
				
			end
		else
			if Student.delete(params[:id])
				flash[:message]="Aluno deletado."
				flash[:type] = "alert alert-success"
				redirect_to controller: 'homes', action: 'index'
				
			else
				flash[:message]="Erro ao excluir aluno."
				flash[:type] = "alert alert-danger"
				redirect_to controller: 'homes', action: 'index'
				
			end
		end
	end
	def listestudentsreport		
		def is_last_day(mydate)
		   return mydate.month != mydate.next_day.month 
		end
		@totaldays = is_last_day(Date.today)
	end
end
