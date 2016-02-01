class UsersController < ApplicationController
	def index
	end
	
	#autenticação do usuário
	def auth_log
		require 'digest'
		level = params[:auth_log]['level']
		password= Digest::SHA256.hexdigest params[:auth_log]['password']

		if @info_user = User.find_by_level_and_password(level,password)
			session[:logged] = 'd397ea1e0cc78fc241bb7132693375539d6f9ccaf02eddbe999b272b0e666cb2'
			session[:info_user] = @info_user
			
			redirect_to controller: 'homes', action: 'index'
		else
			flash[:message] = Digest::SHA256.hexdigest "123"
	        redirect_to controller: 'users', action: 'index'
		end
	end
end
