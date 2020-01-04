crumb :root do
  # link "Home", root_path
  link "メルカリ", root_path
end

crumb :user_mypage do 
  link "マイページ" , mypage_user_path(current_user.id)
  parent :root
end

crumb :user_sell_item do 
  link "出品した商品 - 出品中" , sell_item_user_path(current_user.id)
  parent :user_mypage
end

crumb :user_personal do
  link "本人情報の登録" ,  personal_user_path(current_user.id)
  parent :user_mypage
end

crumb :user_profile do
  link "プロフィール" ,  profile_user_path(current_user.id)
  parent :user_mypage
end

crumb :card_index do
  link "支払い方法" , cards_index_path
  parent :user_mypage
end

crumb :logout do
  link "ログアウト" ,  logout_users_path
  parent :user_mypage
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