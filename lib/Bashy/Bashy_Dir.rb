

class Bashy_Dir

  module Base
    
    include Get_Set::DSL
    attr_get_set :path

    def create
      run %@ #{sudo} mkdir -p #{path} @
    end

    def delete
      run %@ #{sudo} rm -r #{path} @
    end

  end # === Base

  include Bashy::Base
  include Base
  
end # === Bashy_Dir
