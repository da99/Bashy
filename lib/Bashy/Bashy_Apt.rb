

class Bashy_Apt

  module Base
    
    include Get_Set::DSL
    attr_get_set :depends

    def install
      run %@ #{sudo} apt-get -y install #{((depends || []) + [name]).join(' ')} @
    end

    def remove
      run %@ #{sudo} apt-get -y purge #{name} @
    end

  end # === Base

  include Bashy::Base
  include Base
  
end # === Bashy_Apt

