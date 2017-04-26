Rails.application.routes.draw do
devise_for :employees, controllers: {
        sessions: 'employees/sessions'
      }

  get 'change_user_settings/:id/edit' =>"change_user_settings#edit"
  post 'change_user_settings/:id/update' =>"change_user_settings#update",as: "save_password"

  get 'registernewemployees/new'
  post 'registernewemployees/create', as: "create_new_employee"
  get 'registernewemployees/index'
  get 'registernewemployees/:id/edit' =>"registernewemployees#edit",   as: "update_employee"
  patch 'registernewemployees/:id/edit' =>"registernewemployees#update",   as: "save_employee"


   # resources :registernewemployees

  resources :employees do 
    resources :salaries 
    resources :attendances
    resources :leaves
  end
  
  #get '/leaves' => 'leaves#index', as: "leaves"
  match "/attendances" => "attendances#index", as: :attendances_path, via: [:get]
  match '/employees/:id/attendances/update' => "attendances#update", as: "updateEmployeeAttendance" ,via: [:patch]
  get 'attendances/empreport' => 'attendances#view_employee_reports', as: "empreport"
  get 'employee/:id/payslip' => 'attendances#view_payslip_report', as: "monthlypayslip"

  #get 'salary/:id/new' => 'salaries#new', as: "salaries_new"
  get 'salaries/index' =>'salaries#index'

  get 'employee/:id/listview' => 'attendances#list_view', as:'listview'
  #get 'employee/:id/downloadpdf.pdf' => 'attendances#download_pdf', as: "downloadpdf"



root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
