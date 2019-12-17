crumb :root do
  # link "Home", root_path
  link "メルカリ", root_path
end

crumb :user_show do 
  link "マイページ" , users_show_path
  parent :root
end

crumb :user_create do
  link "本人情報の登録" , users_create_path
  parent :user_show
end

crumb :user_update do
  link "プロフィール" , users_update_path
  parent :user_show
end

crumb :card_index do
  link "支払い方法" , cards_index_path
  parent :user_show
end

crumb :logout do
  link "ログアウト" , users_destroy_path
  parent :user_show
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).