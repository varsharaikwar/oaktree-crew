class InitializeUserRoles < ActiveRecord::Migration[7.0]
  def up
    Role.create([{name: 'admin'},
      {name: 'junior_hr'},{name: 'senior_hr'}, {name: 'bde'},{name: 'management'},{name: 'sales_person'}, {name: "pool_manager"}])

    User.create([{email: 'admin@gmail.com',password: '123456789', name: "admin"},
    {email: 'junior_hr@gmail.com',password: '123456789', name: "junior_hr"},
    {email: 'senior_hr@gmail.com',password: '123456789', name: "senior_hr"},
    {email: 'bde@gmail.com',password: '123456789', name: "bde"},
    {email: 'management@gmail.com',password: '123456789', name: "management"},
    {email: 'sales_person@gmail.com',password: '123456789', name: "sales_person"},
    {email: 'pool_manager@gmail.com',password: '123456789', name: "pool_manager"}])

    User.find_by(email: 'admin@gmail.com').add_role("admin")
    User.find_by(email: 'junior_hr@gmail.com').add_role("junior_hr")
    User.find_by(email: 'senior_hr@gmail.com').add_role("senior_hr")
    User.find_by(email: 'bde@gmail.com').add_role("bde")
    User.find_by(email: 'management@gmail.com').add_role("management")
    User.find_by(email: 'sales_person@gmail.com').add_role("sales_person")
    User.find_by(email: 'pool_manager@gmail.com').add_role("pool_manager")
  end

  def down
  end
end
