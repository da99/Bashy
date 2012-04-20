

class Bashy_Apt

  module Base
    
    include Get_Set::DSL
    attr_get_set :depends, :user_and_group

    def cmd
      @cmd = case action
             when :install, nil
               %@ apt-get -y install #{((depends || []) + [name]).join(' ')} @
             when :remove
               %@ apt-get -y remove #{name} && apt-get -y purge #{name} @
             end
    end
    
  end # === Base
  
end # === Bashy_Apt

