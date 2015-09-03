require 'pg'

class DbConnect

	def self.read_user_set_temp
		puts read_mode.getvalue(0,1) #must change 0 value to be last one
	end

	def self.read_user_mode
		puts read_mode.getvalue(0,2) #must change 0 value here
	end

	def self.write_to_db(temp)
		write_temp_mode(temp)
	end


	private

	def self.pg_connect
		@connection = {:host => 'ec2-23-23-126-39.compute-1.amazonaws.com', 
			  :dbname => 'dc383pgrh1blhu', :user => 'ihtyvhunepdkkl', 
			  :port => 5432, 
			  :password => 'T4CfPn_Vo1MTlB0IWuBqyBBfsm'}
		PGconn.connect(@connection)
	end

	def self.read_temps_mode
		pg_connect.exec('SELECT * FROM pitemps')
	end 

	def self.read_webapp_mode
		pg_connect.exec('SELECT * FROM pitemps')
	end 

	def self.write_temp_mode(temp)
		id = read_temps_mode.cmd_tuples + 1
		conn = pg_connect
		conn.prepare('insert_values', 'insert into temperatures (id, temp, created_at, updated_at) values ($1, $2, $3, $4, $5, $6)')
		conn.exec_prepared('insert_values', [ id, temp, Time.now, Time.now]) #these numbers should be variable
	end

end

DbConnect.write_to_db(24)