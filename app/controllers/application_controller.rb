class ApplicationController < ActionController::Base
    #  ログインしていない状態でトップページ以外にアクセスされた場合は、ログイン画面へリダイレクトするように設定
    before_action :authenticate_user!, except: [:top]
    # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行される。
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resourse)
        post_images_path
    end
    
    def after_sign_out_path_for(resource)
    about_path
    end
    
     protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
    # configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
    # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可している。
    # 先ほど述べたように、これはストロングパラメータと同様の機能。

    # privateは記述をしたコントローラ内でしか参照できない。
    # 一方、protectedは呼び出された他のコントローラからも参照することができる。
        
end
