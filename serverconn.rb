require 'pg'

class DbConnect

	def self.read_webapp_user_set_temp
		@conn = pg_connect
		id = @conn.exec('SELECT * FROM thermostats').cmd_tuples
		@value = @conn.exec('SELECT * FROM thermostats').getvalue(id-1,2)
		@conn.close
		return @value
	end

	def self.read_webapp_user_mode
		@conn = pg_connect
		id = @conn.exec('SELECT * FROM thermostats').cmd_tuples
		@value = @conn.exec('SELECT * FROM thermostats').getvalue(id-1,1)
		@conn.close
		return @value
	end

	def self.write_to_db(temp)
		write_temp_mode(temp)
	end

	def self.write_to_webapp(temp, user_mode, user_set_temp)
		write_webapp_mode(temp, user_mode, user_set_temp)
	end

	private

	def self.pg_connect
		@connection = {:host => 'ec2-75-101-143-150.compute-1.amazonaws.com', :dbname => 'dduihcfvkqcf4c', :user => 'kinxfuegyswhqy', :port => 5432, :password => 'TUuZEgrgYrx5TNLl4nlFB6zt7f'}
		PGconn.connect(@connection)
	end

	def self.write_temp_mode(temp)
		@conn = pg_connect
		id = @conn.exec('SELECT * FROM pitemps').cmd_tuples + 1
		@conn.prepare('insert_values', 'insert into pitemps (id, temp, created_at, updated_at) values ($1, $2, $3, $4)')
		@conn.exec_prepared('insert_values', [ id, temp, Time.now, Time.now]) #these numbers should be variable
		@conn.close
	end

	def self.write_webapp_mode(temp, user_mode, user_set_temp)
		@conn = pg_connect
		id = @conn.exec('SELECT * FROM thermostats').cmd_tuples + 1
		@conn.prepare('insert_values', 'insert into thermostats (id, user_mode, user_set_temp, created_at, updated_at) values ($1, $2, $3, $4, $5)')
		@conn.exec_prepared('insert_values', [ id, user_mode, user_set_temp, Time.now, Time.now]) #these numbers should be variable
		@conn.close
	end

end
