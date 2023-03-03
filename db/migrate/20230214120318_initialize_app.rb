class InitializeApp < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
    INSERT INTO ROLES(name, created_at, updated_at) 
    VALUES ('admin', now(), now()), ('junior_hr', now(), now())
    , ('senior_hr', now(), now()), ('bde', now(), now()), ('management', now(), now());  
    SQL

    User.create(email: 'admin@gmail.com',password: '123456789').add_role("admin")
    User.create(email: 'junior_hr@gmail.com',password: '123456789').add_role("junior_hr")
    User.create(email: 'senior_hr@gmail.com',password: '123456789').add_role("senior_hr")
    User.create(email: 'bde@gmail.com',password: '123456789').add_role("bde")
    User.create(email: 'management@gmail.com',password: '123456789').add_role("management")
  end

  def down
  end
end
