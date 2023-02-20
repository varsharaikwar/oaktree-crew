class InitializeApp < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
    INSERT INTO ROLES(name, created_at, updated_at) 
    VALUES ('admin', now(), now()), ('junior_hr', now(), now())
    , ('senior_hr', now(), now()), ('bde', now(), now()), ('management', now(), now());  
    SQL

    User.create(email: 'admin@gmail.com',password: '123456789')
    User.create(email: 'junior_hr@gmail.com',password: '123456789')
    User.create(email: 'senior_hr@gmail.com',password: '123456789')
    User.create(email: 'bde@gmail.com',password: '123456789')
    User.create(email: 'management@gmail.com',password: '123456789')

    User.find_by(email: 'admin@gmail.com').add_role("admin")
    User.find_by(email: 'junior_hr@gmail.com').add_role("junior_hr")
    User.find_by(email: 'senior_hr@gmail.com').add_role("senior_hr")
    User.find_by(email: 'bde@gmail.com').add_role("bde")
    User.find_by(email: 'management@gmail.com').add_role("management")
  end

  def down
  end
end
