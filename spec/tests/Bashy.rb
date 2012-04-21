
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

describe "Bashy_File" do
  
  it "provides sudo as an option" do
    Bashy_File.new { |f|
      f.sudo true
      f.content "a"
      f.path "/tmp/delete.txt"
    }.create.strip
    .should == "echo #{'a'.inspect} > sudo tee /tmp/delete.txt"
  end
  
  it "provides create as a command" do
    Bashy_File.new { |f|
      f.content "my content"
      f.path "/tmp/delete.txt"
    }.create.strip
    .should == "echo #{'my content'.inspect} >  tee /tmp/delete.txt"
  end
  
  it "provides append as a command" do
    Bashy_File.new { |f|
      f.content "my line"
      f.path "/tmp/delete.txt"
    }.append.strip
    .should == "echo #{'my line'.inspect} >>  tee /tmp/delete.txt"
  end

  it "provides chmod as an option" do
    Bashy_File.new { |f|
      f.content "my file"
      f.path "/tmp/delete.txt"
      f.mode "0644"
    }.create.strip.split(%r! +&& +!).last
    .should == %@chmod 0644 /tmp/delete.txt@
  end

  it "provides chown as an option" do
    Bashy_File.new { |f|
      f.content "new file"
      f.path "/tmp/new.txt"
      f.user_and_group "bob"
    }.create.strip.split(%r! +&& +!).last
    .should == %@chown bob:bob /tmp/new.txt@
  end
  
end # === Bashy_File

