class InitializeUserRoles < ActiveRecord::Migration[7.0]
  def up
    Role.create([{name: 'admin'},
      {name: 'junior_hr'},{name: 'senior_hr'}, {name: 'bde'},{name: 'management'},{name: 'sales_person'}])

    User.create([{email: 'admin@gmail.com',password: '123456789'},
    {email: 'junior_hr@gmail.com',password: '123456789'},
    {email: 'senior_hr@gmail.com',password: '123456789'},
    {email: 'bde@gmail.com',password: '123456789'},
    {email: 'management@gmail.com',password: '123456789'},
    {email: 'sales_person@gmail.com',password: '123456789'}])

    User.find_by(email: 'admin@gmail.com').add_role("admin")
    User.find_by(email: 'junior_hr@gmail.com').add_role("junior_hr")
    User.find_by(email: 'senior_hr@gmail.com').add_role("senior_hr")
    User.find_by(email: 'bde@gmail.com').add_role("bde")
    User.find_by(email: 'management@gmail.com').add_role("management")
    User.find_by(email: 'sales_person@gmail.com').add_role("sales_person")
  end

  def down
  end
end
