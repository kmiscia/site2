require 'resque/tasks'
require 'symmetric-encryption'

namespace :secrets do
  
  task "encrypt" do
    SymmetricEncryption::Writer.open(encrypted_secrets_file, encryption_options) do |file| 
      file.write(File.read(decrypted_secrets_file))
    end
  end

  task "decrypt" do
    File.open(decrypted_secrets_file, 'w') do |file| 
      file.write(SymmetricEncryption::Reader.open(encrypted_secrets_file).read)
    end
  end
end

def encryption_options
  { header: false, random_key: false, random_iv: false }
end

def encrypted_secrets_file
  File.join(Rails.root, 'config/encrypted_secrets')
end

def decrypted_secrets_file
  File.join(Rails.root, 'config/secrets.yml')
end