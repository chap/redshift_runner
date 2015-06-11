module RedshiftRunner
  class Connection

    attr_reader :conn

    def initialize(host, port, user, password, dbname)
      @conn = PG::Connection.new(
        :host => host,
        :port => port,
        :user => user,
        :password => password,
        :dbname => dbname,
      )
    end

    def self.establish(connection_name, *args)
      instance_variable_set "@#{connection_name}", new(*args)
      true
    end

    def self.fetch(connection_name)
      instance_variable_get "@#{connection_name}"
    end

  end
end