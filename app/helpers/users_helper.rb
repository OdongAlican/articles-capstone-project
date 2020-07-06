module UsersHelper
    def user_error(user)
        if user.errors.any?
            render :partial => 'errors'
        end
    end

    def login_signup 
        if logged_in?
            link_to('Back', users_path, class: "form-control col-md-3 mx-auto")
        elsif !logged_in?
            link_to('Login', login_path, class: "form-control col-md-3 mx-auto")
        end
    end
end
