require 'pg'

class DbConnect

	def self.read_webapp_user_set_temp
		conn = pg_connect
		id = conn.exec('SELECT * FROM thermostats').cmd_tuples
		puts conn.exec('SELECT * FROM thermostats').getvalue(id-1,2) #must change 0 value to be last one
		conn.close
	end

	def self.read_webapp_user_mode
		conn = pg_connect
		id = conn.exec('SELECT * FROM thermostats').cmd_tuples
		return conn.exec('SELECT * FROM thermostats').getvalue(id-1,1) #must change 0 value here
		conn.close
	end

	def self.write_to_db(temp)
		write_temp_mode(temp)
	end

	def self.write_to_webapp(temp, user_mode, user_set_temp)
		write_webapp_mode(temp, user_mode, user_set_temp)
	end

	private

	def self.pg_connect
		@connection = {:host => 'ec2-23-23-126-39.compute-1.amazonaws.com', :dbname => 'dc383pgrh1blhu', :user => 'ihtyvhunepdkkl', :port => 5432, :password => 'T4CfPn_Vo1MTlB0IWuBqyBBfsm'}
		PGconn.connect(@connection)
	end

	#def self.read_temps_mode
	#	pg_connect.exec('SELECT * FROM pitemps')
	#end 

	#def self.read_webapp_mode
	#	pg_connect.exec('SELECT * FROM thermostats')
	#end 

	def self.write_temp_mode(temp)
		conn = pg_connect
		id = conn.exec('SELECT * FROM pitemps').cmd_tuples + 1
		conn.prepare('insert_values', 'insert into pitemps (id, temp, created_at, updated_at) values ($1, $2, $3, $4)')
		conn.exec_prepared('insert_values', [ id, temp, Time.now, Time.now]) #these numbers should be variable
		conn.close
	end

	def self.write_webapp_mode(temp, user_mode, user_set_temp)
		conn = pg_connect
		id = conn.exec('SELECT * FROM thermostats').cmd_tuples + 1
		conn.prepare('insert_values', 'insert into thermostats (id, user_mode, user_set_temp, created_at, updated_at) values ($1, $2, $3, $4, $5)')
		conn.exec_prepared('insert_values', [ id, user_mode, user_set_temp, Time.now, Time.now]) #these numbers should be variable
		conn.close
	end

end

