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
	def liststudentsreport		
		month = Time.now.month
		year = Time.now.year
		#calcular se é bissexto
		#por padrao serao 20 aulas mas se for bissexto o mes de fevereiro terá 21 aulas
		#if ((($ano % 4) == 0 and ($ano % 100)!=0) or ($ano % 400)==0)
		if month == 2
			if (year%4==0 and year%100!=0) or year%400==0
				@totallessons = 21
			else
				@totallessons = 20
			end
		else
			@totallessons = 20
		end
	end
end
