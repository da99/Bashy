
describe "Bashy_Apt" do
  
  it "provides sudo as an option" do
    Bashy_Apt.new { |o|
      o.sudo true
      o.name "open-ssh"
    }.install.strip
    .should == "sudo apt-get -y install open-ssh"
  end

  it "provides install as a command" do
    Bashy_Apt.new { |o|
      o.name "open-ssh"
    }.install.strip
    .should == "apt-get -y install open-ssh"
  end

  it "provides remove as a command" do
    Bashy_Apt.new { |o|
      o.name "open-ssh"
    }.remove.strip
    .should == "apt-get -y purge open-ssh"
  end
  
end # === Bashy_Apt

describe "Bashy_Dir" do
  
  it "provides sudo as an option" do
    Bashy_Dir.new { |o|
      o.sudo true
      o.path "/tmp/Delet"
    }.create.strip
    .should == "sudo mkdir -p /tmp/Delet"
  end

  it "provides create as a command" do
    Bashy_Dir.new { |o|
      o.path "/tmp/new.txt"
    }.create.strip
    .should == "mkdir -p /tmp/new.txt"
  end
  
  it "provides delete as a command" do
    Bashy_Dir.new { |o|
      o.path "/tmp/old.txt"
    }.delete.strip
    .should == "rm -r /tmp/old.txt"
  end
  
end # === Bashy_Dir

