require 'digest/md5'
def email_hash(email) 
    return Digest::MD5.hexdigest(email.downcase)
end
