class GradesController < ApplicationController
	def listgrades
		@grades = Grade.all
	end
	def newgrade
	end
	def new
		@grade = Grade.new
		params[:grade].each do |param,value|
			@grade[param]=value
		end
		if @grade.save
			redirect_to controller: 'homes', action: 'index'
			flash[:message]="Turma cadastrada."
			flash[:type] = "alert alert-success"
		else
			redirect_to controller: 'homes', action: 'index'
			flash[:message]="Erro ao cadastrar turma."
			flash[:type] = "alert alert-danger"
		end
	end
	def gradestudent
		@grades = Grade.find_by_id(params[:id])
		@all_students = Student.all
		@gradeestudent = Gradeestudent.where('grade_id=?',params[:id])
	end
	def addstudenttograde
		
		c = 0
		params[:student]['student_id'].each_with_index do |x,i|
			@grade = Gradeestudent.new
			if delete_relation = Gradeestudent.find_by_student_id(params[:student]['student_id'][i])
				delete_relation.destroy
				@grade[:student_id]=params[:student]['student_id'][i]
				@grade[:grade_id]=params[:id]
				#@grade.save
			else 
				@grade[:student_id]=params[:student]['student_id'][i]
				@grade[:grade_id]=params[:id]
				#@grade.save
			end
			@grade.save
			c = c+1
		end
		if c==params[:student]['student_id'].count
			redirect_to controller: 'homes', action: 'index'
			flash[:message]="Aluno matriculado."
			flash[:type] = "alert alert-success"
		end
	end
end
