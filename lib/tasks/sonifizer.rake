
namespace :public_folder do

    def deleteOldFile(filename, keepSeconds)

        puts "******* begin *******" 
        puts "Filename: #{filename}"
        puts "Now: #{Time.now} -- Ctime: #{File.stat(filename).ctime}"

        if (Time.now - File.stat(filename).ctime) > keepSeconds
          FileUtils.rm_rf(filename, secure: true)
          puts "*/*/*/* Delete: #{filename} */*/*/*"
        end

        puts "******* end *******" 
    end

    desc "Clear audiofiles from public directory"
    task :clear => :environment do
        keepSeconds = 60
        Dir[Rails.root.to_s + "/public/audio/*"].each do |filename|
            deleteOldFile(filename, keepSeconds)
        end
    end


end