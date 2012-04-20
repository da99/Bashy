

class Bashy_Apt

  module Base
    
    include Get_Set::DSL
    attr_get_set :depends, :sudo

    def install
      cmd :install
    end

    def remove
      cmd :remove
    end

    def cmd action
      sudo = self.sudo ? 'sudo' : ''
      @cmd = case action
             when :install
               %@ #{sudo} apt-get -y install #{((depends || []) + [name]).join(' ')} @
             when :remove
               %@ #{sudo} apt-get -y remove #{name} && apt-get -y purge #{name} @
             end
    end
    
  end # === Base
  
end # === Bashy_Apt

