module SessionsHelper
	def log_in(citizen)
		session[:id] = citizen.id
	end

	def current_citizen
		@current_citizen ||= Citizen.find_by(id: session[:id])
	end

	def logged_in?
		!current_citizen.nil?
	end

	def log_out
		session.delete(:id)
		@current_citizen = nil
	end

	def admin_logged_in?
		if logged_in?
			current_citizen.admin
		end
	end
end
