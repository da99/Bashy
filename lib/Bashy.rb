require 'Bashy/version'
require 'Get_Set'

class Bashy
  
  module Base
    
    include Get_Set::DSL
    attr_get_set :name

    def run cmd
      cmd
    end

    def initialize 
      yield self
    end
    
    def sudo val = :_RETURN_
      if val == :_RETURN_
        @sudo ? 'sudo' : nil
      else
        @sudo = val
      end
    end

    def user_and_group val = :_RETURN_
      if val == :_RETURN_
        og = [@user_and_group, @user_and_group]
        .compact
        .map(&:to_s)
        .map(&:strip)
        .reject(&:empty?)
        .join(':')

        return nil if og.empty?
        og
      else
        @user_and_group = val
      end
    end

  end # === Base
  
end # === class Bashy

require 'Bashy/Bashy_Apt'
require 'Bashy/Bashy_File'
require 'Bashy/Bashy_Dir'
