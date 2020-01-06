require 'xcodeproj'

def addScriptToProjectTarget(path_to_project,target_name)
    puts "Start adding script to project path: #{path_to_project} on target #{target_name}" 
    project = Xcodeproj::Project.open(path_to_project)
    main_target = project.targets.select{|target| target.name == target_name}.first
    if main_target == nil 
        puts "Script was not added"
    else
        phase = main_target.new_shell_script_build_phase("Initialize Crashlytics")
        phase.shell_script = "${PODS_ROOT}/Fabric/run"
        project.save()
        puts "Script was added"
    end
end

# Get project directory path
target_name = ARGV[0]
project_file = ARGV[1]
addScriptToProjectTarget(project_file,target_name)